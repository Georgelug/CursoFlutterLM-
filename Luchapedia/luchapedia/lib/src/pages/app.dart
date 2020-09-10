import 'package:flutter/material.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purpleAccent[700],
      debugShowCheckedModeBanner: false,
      home: Container(child: HomePage()),
    );
  }
}
