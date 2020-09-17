import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/goals_page.dart';
import 'package:aquadoro/src/pages/aquadorop_page.dart';
import 'package:aquadoro/src/pages/pantalla_carga.dart';

class MyApp extends StatelessWidget {
  // Otra manera de iniciar una pagina,en lugar del parametro 'home', es definiendo las rutas y despues especificando cual se va a iniciar.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aqudoro',
        routes: {
          'pantallaCarga': (BuildContext context) => PantalleDeCarga(),
          'goalsPage': (BuildContext context) => GoalsPage(),
          'aquadoro': (BuildContext context) => Aquadoro(),
        },
        initialRoute: 'pantallaCarga',
      );
}
