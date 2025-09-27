import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  String selectedCountry = "+254";
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 2.h),
          children: [
            SizedBox(height: 3.h),

            Text(
              "Enter your Mobile Number",
              style: AppTextStyles.subheading(context),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          selectedCountry = "+${country.phoneCode}";
                        });
                        print("Select country:${country.displayName}");
                      },
                    );
                  },
                  child: Container(
                    height: 7.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: Colors.grey,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      selectedCountry,
                      style: AppTextStyles.body(context),
                    ),
                  ),
                ),
                SizedBox(
                  width: 45.w,
                  height: 7.h,
                  child: TextField(
                    controller: phoneController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 2.w,
                      ),
                      hintText: "Mobile Number",
                      hintStyle: AppTextStyles.body(context),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                minimumSize: Size(90.w, 8.h),
              ),

              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: AppTextStyles.subheading(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    right: 2.w,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.w),
            Text(
              "By proceeding you consent to get call,Whatsapp,or SMS messages,including by automated means ,from Megawatt and its adffiliates to the number provided.",
              style: AppTextStyles.caption(context),
            ),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "or",
                    style: AppTextStyles.heading2(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ),

                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                minimumSize: Size(90.w, 10.h),
              ),

              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Google",
                      style: AppTextStyles.subheading(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 2.w,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                      size: 9.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
