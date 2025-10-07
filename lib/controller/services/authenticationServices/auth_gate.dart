import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/signInLogic%20.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //user is logged in
          if (snapshot.hasData) {
            return const Homepage();
          }
          //user is  not logged in
          else {
            return const SignInLogic();
          }
        },
      ),
    );
  }
}
