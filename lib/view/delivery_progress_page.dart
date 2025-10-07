import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/controller/services/authenticationServices/firestore.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/receipt.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  final FirestoreServices _db = FirestoreServices();

  @override
  void initState() {
    super.initState();
    //submit order to database
    String receipt = context.read<Restaurant>().displayCartReceipt();
    _db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Delivery Progress",
            style: TextStyle(color: AppColors.primaryOrange),
          ),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [Receipt()])),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.accentOrange,
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          //delivery guy profile picture
          Container(
            decoration: BoxDecoration(
              color: AppColors.accentPurple,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),

          //details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ben Ten",
                style: AppTextStyles.subheading(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: AppColors.accentOrange,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message, color: AppColors.primaryPurple),
                ),
              ),
              SizedBox(width: 15),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.accentOrange,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call, color: AppColors.primaryPurple),
                ),
              ),

              //call button
            ],
          ),
        ],
      ),
    );
  }
}
