import 'package:flutter/material.dart';
import 'package:megawatt/utils/textfields.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/home.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatefulWidget {
  final void Function()? onTap;
  Signup({super.key, required this.onTap});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create an Account',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1(context),
            ),
            const SizedBox(height: 32),
            // Name Input Field
            MyTextField(
              controller: emailcontroller,
              obscureText: false,
              labelText: 'Email Address',
              hintText: "Enter your Email",
            ),

            // Password Input Field
            MyTextField(
              controller: passwordcontroller,
              obscureText: true,
              labelText: 'Password',
              hintText: "Enter your Password",
            ),
            MyTextField(
              controller: confirmcontroller,
              obscureText: true,
              labelText: ' Confirm Password',
              hintText: "Enter your Password again",
            ),

            SizedBox(height: 24),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sign up logic here
                debugPrint('Sign Up button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Sign Up', style: AppTextStyles.button(context)),
            ),
            const SizedBox(height: 16),
            // Link to the login page
            GestureDetector(
              onTap: () {
                widget.onTap!();
                // TODO: Implement navigation to the login page
                debugPrint('Navigate to login');
              },
              child: Text(
                "Already have an account? Login Here",
                textAlign: TextAlign.center,
                style: AppTextStyles.body(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
