import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/quiz.png',
          height: 60,
        ),
        Text(
          "",
          style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}