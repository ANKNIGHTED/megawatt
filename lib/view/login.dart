import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/mybutton.dart';
import 'package:megawatt/utils/textfields.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/signup.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  void login() {
    /*
  fill out authentication here..
*/

    //navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 3.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: AppTextStyles.heading1(context),
              ),
              Image.asset(
                'assets/images/splashscreen/whitecafe-Photoroom.png',
                width: 175.px,
                height: 145.px,
                fit: BoxFit.fitHeight,
              ),

              SizedBox(height: 3.h),
              Text(
                'Food for the Nation',
                textAlign: TextAlign.center,
                style: AppTextStyles.body(
                  context,
                ).copyWith(color: AppColors.textMuted),
              ),
              // Email Input Field
              SizedBox(height: 3.h),
              MyTextField(
                controller: emailcontroller,
                obscureText: false,
                labelText: 'Email Address',
                hintText: "Enter your Email",
              ),
              SizedBox(height: 3.h),
              // Password Input Field
              MyTextField(
                controller: passwordcontroller,
                obscureText: true,
                labelText: 'Password',
                hintText: "Enter your Password",
              ),

              SizedBox(height: 3.h),
              // Login Button
              Mybutton(
                text: 'Login',
                onTap: () {
                  login();
                },
              ),

              SizedBox(height: 2.h),

              // Link to the sign-up page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(context).copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: widget.onTap,

                    child: Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              /*
              GestureDetector(
                onTap: () {
                  // TODO: Implement navigation back to the sign-up page
                  debugPrint('Navigate back to sign up');
                  // You can use a Navigator push replacement to go back to the home/signup page
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) => const HomePage()),
                  // );
                },
              
                child: Text(
                  "Don't have an account? Sign Up",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
              ),
                */
            ],
          ),
        ),
      ),
    );
  }
}
