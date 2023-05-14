
import 'package:flutter/material.dart';
import 'package:homepage/home.dart';
import 'package:homepage/login.dart';
import 'package:homepage/splash.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME ='UserLoggedIn';

void main() {
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    home: splash(),
    );
  }
}
