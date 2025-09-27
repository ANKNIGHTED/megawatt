import 'package:flutter/material.dart';
import 'package:megawatt/view/authentication.dart';
import 'package:megawatt/view/cart.dart';
import 'package:megawatt/view/home.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/login.dart';
import 'package:megawatt/view/profile.dart';
import 'package:megawatt/view/search.dart';
import 'package:megawatt/view/settings.dart';
import 'package:megawatt/view/signup.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const Megawatt());
}

class Megawatt extends StatelessWidget {
  const Megawatt({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: AppColors.lightScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: AppColors.darkScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          home: Homepage(),
          routes: {
            '/Home': (context) => Home(),
            '/Signup': (context) => Signup(),
            '/Login': (context) => Login(),
            '/Cart': (context) => Cart(),
            '/Profile': (context) => Profile(),
            '/Settings': (context) => Settings(),
            '/Search': (context) => Search(),
          },
        );
      },
    );
  }
}
