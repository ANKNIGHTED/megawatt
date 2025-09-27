import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List profile = [
    [Icons.shop, 'Orders'],
    [Icons.favorite, 'Your Favourites'],
    [Icons.help, 'Help'],
    [Icons.wallet, 'Wallet'],
    [Icons.settings, 'Settings'],
    [Icons.logout, 'Sign Out'],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),

          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 8.h,
                  backgroundColor: AppColors.primaryPurple,
                  child: CircleAvatar(
                    child: Icon(Icons.person, size: 10.h),
                    radius: 8.h - 2,
                  ),
                ),
                SizedBox(width: 2.h),
                Text("User's name", style: AppTextStyles.heading2(context)),
              ],
            ),
            SizedBox(height: 4.h),
            ListView.builder(
              itemCount: profile.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(profile[index][0], size: 3.h),
                  title: Text(
                    profile[index][1],
                    style: AppTextStyles.subheading(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
