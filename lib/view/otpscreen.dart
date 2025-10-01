import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController OtpController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  int resendOTPCounter = 60;

  decreaseOTPCounter() async {
    if (resendOTPCounter > 0) {
      setState(() {
        resendOTPCounter -= 1;
      });
      await Future.delayed(const Duration(seconds: 1));
      decreaseOTPCounter();
    }
  }

  @override
  void initstate() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      decreaseOTPCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: 10.w,
            bottom: 3.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: StadiumBorder(),
                padding: EdgeInsets.all(1.h),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Authentication');
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                size: 4.h,
                color: AppColors.primaryPurple,
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            bottom: 3.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPurple,
                elevation: 2,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Next",
                    style: AppTextStyles.button(
                      context,
                    ).copyWith(color: AppColors.textDark),
                  ),
                  SizedBox(width: 2.h),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 4.h,
                    color: AppColors.primaryPurple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(height: 3.h),
          Text(
            "Enter the 4 digit code sent to 0797428006",
            style: AppTextStyles.subheading(context),
          ),
          SizedBox(height: 3.h),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: const Color.fromRGBO(
                255,
                152,
                0,
                1,
              ), // Primary color for fields that have input
              activeColor: AppColors.primaryOrange,
              inactiveFillColor:
                  AppColors
                      .backgroundLight, // Light fill for non-selected fields
              inactiveColor: AppColors.textMuted,

              selectedFillColor:
                  Colors
                      .white, // Use white or backgroundLight for better contrast
              selectedColor: AppColors.primaryPurple,
            ),
            animationDuration: const Duration(milliseconds: 300),

            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: OtpController,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {},
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp),
                  color: AppColors.accentPurple,
                ),
                child: Text(
                  "I haven't received a code (0.$resendOTPCounter)",
                  style: AppTextStyles.subheading(context).copyWith(
                    color:
                        resendOTPCounter > 0
                            ? AppColors.textDark
                            : AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
