import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/controller/provider/authProvider.dart';
import 'package:megawatt/controller/provider/colors_provider.dart';
import 'package:megawatt/firebase_options.dart';
import 'package:megawatt/view/authentication.dart';
import 'package:megawatt/view/cart.dart';
import 'package:megawatt/view/favourites.dart';
import 'package:megawatt/view/home.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/login.dart';
import 'package:megawatt/view/orders.dart';

import 'package:megawatt/view/otpscreen.dart';
import 'package:megawatt/view/profile.dart';
import 'package:megawatt/view/search.dart';
import 'package:megawatt/view/settings.dart';
import 'package:megawatt/view/signInLogic%20.dart';
import 'package:megawatt/view/signup.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Megawatt());
}

class Megawatt extends StatelessWidget {
  const Megawatt({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ColorsProvider>(
              create: (_) => ColorsProvider(),
            ),
          ],
          child: MaterialApp(
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
            home: SignInLogic(),
            routes: {
              '/Home': (context) => Home(),
              '/Signup': (context) => Signup(onTap: () {}),
              '/Login': (context) => Login(onTap: () {}),
              '/Cart': (context) => Cart(),
              '/Profile': (context) => Profile(),
              '/Settings': (context) => Settings(),
              '/Search': (context) => Search(),
              '/Optscreen': (context) => Otpscreen(),
              '/Orders': (context) => Orders(),
              'Favoutires': (context) => Favourites(),
              // '/Authentication': (context) => Authentication(),
            },
          ),
        );
      },
    );
  }
}
