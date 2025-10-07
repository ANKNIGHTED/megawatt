import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/receipt.dart';
import 'package:megawatt/utils/textstyles.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

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
      body: Column(children: [Receipt()]),
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
