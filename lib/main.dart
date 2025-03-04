import 'package:flutter/material.dart';
import 'package:scanapp/splash_screen.dart';

void main() {
  runApp(MyApp());
}
// MY APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
      ),
    );
  }
}