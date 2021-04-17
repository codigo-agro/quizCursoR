import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_01/model/slide.dart';
import 'package:quiz_01/pages/choice.quiz.dart';
import 'package:quiz_01/widgets/slide.dots.widget.dart';
import 'package:quiz_01/widgets/slide.item.widget.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/capa07.jpg"),
          fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i) => SlideItem(i),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 35),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < slideList.length; i++)
                              if (i == _currentPage)
                                SlideDots(true)
                              else
                                SlideDots(false)
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Começar o Quiz",
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChoiceQuiz();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/codagrologo.png',
                  height: 50,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}