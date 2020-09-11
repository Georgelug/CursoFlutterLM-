import 'package:flutter/material.dart';

class AllFighters extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _barraSuperior(),
      );

  // Barra Superior
  Widget _barraSuperior() => AppBar(
        title: Text('Todos los luchadores'),
      );
}
