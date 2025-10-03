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
    [Icons.shop, 'Orders', '/Orders'],
    [Icons.favorite, 'Your Favourites', '/Help'],

    [Icons.help, 'Help', '/Help'],
    [Icons.wallet, 'Wallet', '/Wallet'],
    [Icons.settings, 'Settings', '/Settings'],
    [Icons.logout, 'Sign Out', '/SignInLogic'],
  ];

  void _handleTap(BuildContext context, String route) {
    if (route == 'logout') {
      // Logic for signing out (e.g., calling a provider method)
      print('Sign Out logic needs to be implemented here.');
      // No navigation push, maybe pushReplacement to login page:
      // Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Use pushNamed for all defined pages
      Navigator.pushNamed(context, route);
    }
  }

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
                final item = profile[index];
                final IconData icon = item[0];
                final String title = item[1];
                final String route = item[2];
                return ListTile(
                  leading: Icon(profile[index][0], size: 3.h),
                  title: Text(
                    title,
                    //profile[index][1],
                    style: AppTextStyles.subheading(context),
                  ),
                  onTap: () {
                    _handleTap(context, route);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
