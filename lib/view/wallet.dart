import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/mybutton.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/payment.dart';
import 'package:megawatt/view/delivery_progress_page.dart'; // Import the delivery page
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:megawatt/controller/services/authenticationServices/firestore.dart';

// 1. Define Payment Methods Enum for state tracking
enum PaymentMethod { cash, card, mpesa }

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  PaymentMethod _selectedMethod = PaymentMethod.cash;

  // 🎯 Action for the 'Continue with Payment' button
  Future<void> _processPayment() async {
    final restaurant = context.read<Restaurant>();
    if (restaurant.cart.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cart is empty')));
      return;
    }

    final String receipt = restaurant.displayCartReceipt();
    final double total = restaurant.getTotalPrice();
    final orderData = <String, dynamic>{
      'receipt': receipt,
      'total': total,
      'paymentMethod': _selectedMethod.toString().split('.').last,
      'createdAt': FieldValue.serverTimestamp(),
      //optionally include user id if your stream filters by 'uid'
      'uid': FirebaseAuth.instance.currentUser?.uid,
      'items': restaurant.cart.map((c) => c.toMap()).toList(),
    };

    if (_selectedMethod == PaymentMethod.cash ||
        _selectedMethod == PaymentMethod.mpesa) {
      await FirestoreServices().saveOrderToDatabase(
        orderData,
      ); // must accept Map
      restaurant.clearCart();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeliveryProgressPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Payment()),
      );
    }
  }

  // Widget to build each tappable payment option tile
  Widget _buildPaymentOption(
    BuildContext context,
    PaymentMethod method,
    IconData icon,
    String title,
    String subtitle,
  ) {
    final bool isSelected = _selectedMethod == method;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color:
              isSelected ? colorScheme.secondaryContainer : colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected
                    ? AppColors.primaryPurple
                    : colorScheme.onSurface.withOpacity(0.1),
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            // Icon / Radio Indicator
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color:
                  isSelected ? AppColors.primaryPurple : colorScheme.onSurface,
            ),
            SizedBox(width: 4.w),
            // Payment Method Icon
            Icon(icon, size: 4.h, color: AppColors.primaryPurple),
            SizedBox(width: 4.w),
            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.subheading(
                      context,
                    ).copyWith(color: colorScheme.onSurface),
                  ),
                  Text(subtitle, style: AppTextStyles.caption(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the total price for display
    final cartProvider = context.watch<Restaurant>();
    final double cartTotal = cartProvider.getTotalPrice();

    return Scaffold(
      appBar: AppBar(title: const Text('Payment Options'), centerTitle: true),
      body: Column(
        children: [
          // 2. Wallet Total Display (Uber-like)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Total",
                  style: AppTextStyles.heading2(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Ksh ${cartTotal.toStringAsFixed(2)}",
                  style: AppTextStyles.heading1(context).copyWith(
                    color: AppColors.primaryOrange, // Highlight the price
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 3.h),

          // 3. Payment Method Options (Scrollable)
          Expanded(
            child: ListView(
              children: [
                Text(
                  "Select Payment Method",
                  style: AppTextStyles.heading2(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),

                // Option 1: Cash on Delivery
                _buildPaymentOption(
                  context,
                  PaymentMethod.cash,
                  Icons.monetization_on,
                  "Cash on Delivery",
                  "Pay the courier when your food arrives.",
                ),

                // Option 2: Pay with Card
                _buildPaymentOption(
                  context,
                  PaymentMethod.card,
                  Icons.credit_card,
                  "Credit / Debit Card",
                  "Securely pay with your saved card.",
                ),

                // Option 3: Mpesa
                _buildPaymentOption(
                  context,
                  PaymentMethod.mpesa,
                  Icons.phone_android,
                  "Lipa na Mpesa",
                  "Pay using the M-Pesa mobile service.",
                ),
              ],
            ),
          ),

          // 4. Continue Button (Fixed at Bottom)
          Padding(
            padding: EdgeInsets.only(bottom: 5.h, left: 14, right: 14),
            child: Mybutton(
              text: "Continue with Payment",
              onTap: _processPayment,
            ),
          ),
        ],
      ),
    );
  }
}
