import 'package:flutter/material.dart';
import 'package:megawatt/view/login.dart';
import 'package:megawatt/view/signup.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  bool showLoginPage = true;
  //toggle between login and signup
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: togglePages);
    } else {
      return Signup(onTap: togglePages);
    }
  }
}
