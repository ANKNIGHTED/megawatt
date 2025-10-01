import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? mobileNumber;
  String? verificationID;
  void updateVerificationID(String verification) {
    verificationID = verification;
    notifyListeners();
  }

  updateMobileNumber(String number) {
    mobileNumber = number;
    //notifyListeners();
  }
}
