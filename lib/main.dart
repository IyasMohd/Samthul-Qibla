import 'package:flutter/material.dart';
import 'package:samthul_qibla/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Samthul Qibla',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const ScreenHome());
  }
}
