import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _barraSuperior(),
        body: _cuerpo(),
      );

  Widget _barraSuperior() => AppBar(
        title: Text('Goals page'),
        centerTitle: true,
      );

  Widget _cuerpo() => Center(
        child: Container(
          child: Text('Hallo welt'),
        ),
      );
}
