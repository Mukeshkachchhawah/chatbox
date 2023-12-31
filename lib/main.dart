import 'package:chat_appilication/screens/onbording/splace_screens.dart';
import 'package:chat_appilication/screens/screens/bottom_bar.dart';
import 'package:chat_appilication/screens/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplaceScreens(),
      // home: BottomBarPages(),
    );
  }
}
