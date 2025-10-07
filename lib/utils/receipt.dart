import 'package:flutter/material.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thank you for your order!",
              style: AppTextStyles.heading2(context),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryPurple),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Consumer<Restaurant>(
                builder:
                    (context, restaurant, child) =>
                        Text(restaurant.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Estimated Delivery Time is 1:30pm"),
          ],
        ),
      ),
    );
  }
}
