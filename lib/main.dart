import 'package:flutter/material.dart';
import 'package:quiz_01/pages/splash.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Curso R',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreenPage(),
    );
  }
}
