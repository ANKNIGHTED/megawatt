/*
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/constant/constant.dart';
import 'package:megawatt/view/authentication.dart';
import 'package:megawatt/view/homepage.dart';

import 'package:megawatt/view/otpscreen.dart';
import 'package:megawatt/view/signInLogic%20.dart';
import 'package:page_transition/page_transition.dart';
import 'package:megawatt/controller/provider/authProvider.dart' as app;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authenticationservices {
  static bool checkAuthentication(BuildContext context) {
    User? user = auth.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Authentication()),
        (route) => false,
      );
      return false;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
      (route) => false,
    );
    return true;
  }

  static receiveOTP({
    required BuildContext context,
    required String mobileNo,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credentials) {
          log(credentials.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
          throw Exception(exception);
        },
        codeSent: (String verificationID, int? resendToken) {
          context.read<app.AuthProvider>().updateVerificationID(verificationID);
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: Otpscreen(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<app.AuthProvider>().verificationID!,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: SignInLogic(),
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
*/
