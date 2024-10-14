import 'package:flutter/material.dart';
import 'package:fruits_app/model/user.dart';
import 'package:fruits_app/screens/auth/splashscreen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
