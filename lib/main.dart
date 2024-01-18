import 'package:chatapp/pages/loginPage.dart';
import 'package:chatapp/themes/light_Mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Chat App',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginPage(),
    );
  }
}
