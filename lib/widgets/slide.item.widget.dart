import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_01/model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image.asset(
            slideList[index].imageUrl,
            height: 80,
          ),
        ),
        SizedBox(
          height: 30
          ),
        Container(
          margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 20
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: AutoSizeText(
                slideList[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
        ),
      ],
    );
  }
}