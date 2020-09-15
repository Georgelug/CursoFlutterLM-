import 'package:aquadoro/src/pages/goal_card.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  GoalspageState createState() => GoalspageState();
}

class GoalspageState extends State<GoalsPage> {
  BuildContext _context;
  double anchoPantalla;
  List<String> textoBarra = [
    "¿Qué es lo realmente\nimportante?",
    "Vamos a\nhacerlo c:",
    "¿Qué has estado dejando\npendiente?"
  ];
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpo(),
    );
  }

  Widget _barraSuperior() => AppBar(
        title: _fadeText(texto: textoBarra),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      );

  Widget _cuerpo() => Center(
          child: Stack(
        children: [
          Container(
            color: Colors.cyan[600],
          ),
          Column(
            children: [
              GoalCard(),
              GoalCard(),
            ],
          )
        ],
      ));

  Widget _fadeText({List<String> texto}) => Container(
        margin: EdgeInsets.only(top: 5),
        child: SizedBox(
          width: 350.0,
          child: FadeAnimatedTextKit(
              repeatForever: true,
              text: texto,
              textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[50]),
              textAlign: TextAlign.center,
              alignment:
                  AlignmentDirectional.bottomCenter // or Alignment.topLeft
              ),
        ),
      );
}
