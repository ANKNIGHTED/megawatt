import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/controller/services/authenticationServices/firestore.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text('Orders'))),
        body: Center(
          child: Text(
            'Please sign in to view your orders',
            style: AppTextStyles.subheading(context),
          ),
        ),
      );
    }

    final FirestoreServices _db = FirestoreServices();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Orders')),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryPurple,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _db.ordersForUserStream(user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'You have no previous orders',
                style: AppTextStyles.subheading(context),
              ),
            );
          }

          final docs = snapshot.data!.docs;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: docs.length,
            separatorBuilder: (_, __) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final data = docs[index].data();
              final Timestamp? ts = data['createdAt'] as Timestamp?;
              final dateStr =
                  ts != null
                      ? DateFormat.yMMMd().add_jm().format(ts.toDate())
                      : 'Unknown date';
              final receipt = data['receipt'] as String? ?? '';
              final total =
                  data['total'] != null
                      ? (data['total'] as num).toDouble()
                      : 0.0;
              final firstLine = receipt
                  .split('\n')
                  .firstWhere(
                    (l) => l.trim().isNotEmpty,
                    orElse: () => 'Order',
                  );

              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  title: Text(
                    firstLine,
                    style: AppTextStyles.subheading(context),
                  ),
                  subtitle: Text(dateStr),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: AppTextStyles.button(context),
                      ),
                      SizedBox(height: 6),
                      Text('View', style: AppTextStyles.subheading(context)),
                    ],
                  ),
                  onTap: () {
                    // show full receipt in a dialog
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Order - $dateStr'),
                            content: SingleChildScrollView(
                              child: SelectableText(receipt),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Close'),
                              ),
                            ],
                          ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
