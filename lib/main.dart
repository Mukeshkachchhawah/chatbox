// main.dart
import 'package:chat_appilication/provider/chat_provider.dart';
import 'package:chat_appilication/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI ChatBot',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BottomBarPages(),
    );
  }
}
