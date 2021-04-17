import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/r_logo.png',
    title: "Ambiente R",
  ),
  Slide(
    imageUrl: 'assets/images/graphic.png',
    title: "Análises Estatísticas",
  ),
  Slide(
    imageUrl: 'assets/images/rstudio.png',
    title: "Usando R e R Studio",
  ),
  Slide(
    imageUrl: 'assets/images/onlineclass.png',
    title: "Aulas Online",
  ),
];