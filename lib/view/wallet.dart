import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // Use a nullable string or initialize with a default value
  String selectedCountry = "+254";
  TextEditingController _phoneController = TextEditingController();

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
              children: [
                // Combine the InkWell and Container for the country code
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          // Correct string interpolation
                          selectedCountry = "+${country.phoneCode}";
                        });
                        if (kDebugMode) {
                          print("Selected country: ${country.displayName}");
                        }
                      },
                    );
                  },
                  child: Container(
                    height: 6.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: Colors.grey.withOpacity(0.2), // Lighter shade
                    ),
                    alignment: Alignment.center, // Center the text
                    child: Text(
                      selectedCountry,
                      style: AppTextStyles.heading2(context),
                    ),
                  ),
                ),
                SizedBox(width: 2.w), // Add some space between widgets
                // Added an Expanded TextField for the phone number
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can access the phone number here
                String fullNumber = selectedCountry + _phoneController.text;
                if (kDebugMode) {
                  print("Full number: $fullNumber");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                minimumSize: Size(90.w, 6.h),
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
              "By proceeding you consent to get calls, Whatsapp, or SMS messages, including by automated means, from Megawatt and its affiliates to the number provided.",
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
          ],
        ),
      ),
    );
  }
}
