import 'package:flutter/material.dart';
import 'package:hackto/screens/login%20screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reuth Hospital',
      home: const LoginScreen(), // Use the unified RoleSelectScreen
    );
  }
}
