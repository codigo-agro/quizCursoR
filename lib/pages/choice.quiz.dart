import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_01/pages/home.page.dart';
import 'package:quiz_01/pages/quiz_page.dart';
import 'package:quiz_01/widgets/logo.widget.dart';

class ChoiceQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              },
          )
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFF696969),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/fundo09.jpeg"),
          fit: BoxFit.cover)
        ),
        child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Logo(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            ),
            child: AutoSizeText(
              "Escolha o assunto",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Merriweather',
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizPage();
                }));
              },
              child: Text(
                "Correlação",
                style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Regressão Linear",
                style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Teste t de Student",
                style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Testes de Média e Agrupamento de Médias",
                style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Analise exploratória de dados",
                style: TextStyle(
              fontFamily: 'Merriweather',fontSize: 12,
              fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(
            'assets/images/codagrologo.png',
            height: 50,
          ),   
        ],
       ),
      ),
    );
  }
}