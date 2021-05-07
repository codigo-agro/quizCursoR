import 'package:flutter/material.dart';
import 'package:quiz_01/pages/home.page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF2b1d0e), Color(0xFF2b1d0e)],
        ),
        navigateAfterSeconds: MyHomePage(),
        loaderColor: Colors.transparent,
      ),
      Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/icon.png',
                height: 80,
              ),
              Text(
                "Calagem App",
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    ],
  );
}
