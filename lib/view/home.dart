import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
          children: [
            SizedBox(height: 2.h),
            Text('current location', style: AppTextStyles.body(context)),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: AppColors.accentPurple,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Specials",
                          style: AppTextStyles.subheading(context),
                        ),
                        SizedBox(width: 4.w),
                        SizedBox(
                          width: 20.h,
                          child: Image(
                            image: AssetImage('images/categories/specials.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
