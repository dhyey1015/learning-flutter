import 'package:flutter/material.dart';
import 'package:reddit_clone/features/auth/screen/login_screen.dart';
import 'package:reddit_clone/theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit clone',
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
