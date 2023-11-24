import 'dart:async';

import 'package:chat_appilication/ui_helper.dart';
import 'package:flutter/material.dart';

import 'onbording_screens.dart';

class SplaceScreens extends StatefulWidget {
  const SplaceScreens({super.key});

  @override
  State<SplaceScreens> createState() => _SplaceScreensState();
}

class _SplaceScreensState extends State<SplaceScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnbordingScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/c.png",
            color: Color(0xff24786D),
            scale: 10,
          ),
          hSpace(),
          Center(
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
