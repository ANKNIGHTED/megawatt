import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: TextField(
        controller: controller,
        obscureText: obscureText,

        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryPurple),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.accentPurple),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.textMuted),
        ),
      ),
    );
  }
}
