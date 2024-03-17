import 'dart:async';

import 'package:chat_appilication/screens/onbording/log_in.dart';
import 'package:chat_appilication/screens/screens/home_page.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onbording_screens.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => SplashScreensState();
}

class SplashScreensState extends State<SplashScreens> {
  static const String LoginKey = "Login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  /// sherPref
  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();

    var isLogin = pref.getBool(LoginKey);
    Timer(const Duration(seconds: 2), () async {
      // Widget navigateToPage = LoginScreen();

      if (isLogin != null) {
        if (isLogin) {
          //when true
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(),
              ));
          // navigateToPage = SignUpScreen();
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnbordingScreen(),
            ));
        // navigateToPage = SignUpScreen();
      }
    });
  }

  //// shar pref.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/c.png",
            color: const Color(0xff24786D),
            scale: 10,
          ),
          hSpace(),
          const Center(
            child: Text(
              'Chatbox',
              style: TextStyle(
                  color: Color(0xff001815),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
