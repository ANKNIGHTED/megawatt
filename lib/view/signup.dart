import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:megawatt/controller/services/authenticationServices/authenticationServices.dart';
import 'package:megawatt/utils/textfields.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/signInLogic%20.dart';

import 'package:sizer/sizer.dart';

class Signup extends StatefulWidget {
  final void Function()? onTap;
  const Signup({super.key, required this.onTap});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  void register() async {
    final _authService = Authenticationservices();

    if (passwordcontroller.text == confirmcontroller.text) {
      try {
        // Step 1: Create the user
        final userCredential = await _authService.signUpWithEmailPassword(
          emailcontroller.text.trim(),
          passwordcontroller.text.trim(),
        );

        // Step 2: Get the user ID
        final user = userCredential.user;
        if (user != null) {
          // Step 3: Save user details to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
                'username': usernamecontroller.text.trim(),
                'email': emailcontroller.text.trim(),
                'createdAt': DateTime.now(),
              });
        }

        // Step 4: Show success message
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text("Account Created Successfully!"),
                content: const Text("Please log in to continue."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // close dialog
                      // Step 5: Navigate to Login Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInLogic()),
                      );
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder:
            (context) =>
                const AlertDialog(title: Text("Passwords don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/splashscreen/whitecafe-Photoroom.png',
                width: 175.px,
                height: 140.px,
                fit: BoxFit.cover,
              ),
              Text(
                'Create an Account',
                textAlign: TextAlign.center,
                style: AppTextStyles.heading1(context),
              ),
              const SizedBox(height: 32),

              // Username Input Field
              MyTextField(
                controller: usernamecontroller,
                obscureText: false,
                labelText: 'Username',
                hintText: "Enter your username",
              ),

              // Email Input Field
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

              // Confirm Password Input Field
              MyTextField(
                controller: confirmcontroller,
                obscureText: true,
                labelText: 'Confirm Password',
                hintText: "Enter your Password again",
              ),

              const SizedBox(height: 24),

              // Sign Up Button
              ElevatedButton(
                onPressed: register,
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
                onTap: widget.onTap,
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
      ),
    );
  }
}
