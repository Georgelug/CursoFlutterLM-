import 'package:flutter/material.dart';

class Aquadoro extends StatefulWidget {
  final String actividad;
  final int tConcentracion;
  final int tRelax;

  Aquadoro({this.actividad, this.tConcentracion, this.tRelax});

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpo(),
    );
  }

  Widget _barraSuperior() => AppBar(
        title: Text('Aquadoro'),
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
              Center(child: Text('${widget.actividad}')),
              Center(child: Text('${widget.tConcentracion}')),
              Center(child: Text('${widget.tRelax}')),
            ],
          )
        ],
      ));
}
