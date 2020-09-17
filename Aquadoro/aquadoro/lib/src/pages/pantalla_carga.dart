import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:aquadoro/src/pages/goals_page.dart';

class PantalleDeCarga extends StatefulWidget {
  PantalleDeCarga({Key key}) : super(key: key);

  @override
  _PantalleDeCargaState createState() => _PantalleDeCargaState();
}

class _PantalleDeCargaState extends State<PantalleDeCarga> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: GoalsPage(),
      title: Text(
        'Aquadoro',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
            color: Colors.blueGrey[50]),
      ),
      image: Image.asset('assets/Acuadoro.png'),
      photoSize: 120.0,
      backgroundColor: Colors.blueAccent,
    );
  }
}
