import 'dart:async';

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
  String tipoActividad = "Focus";
  String tiempoPantalla;
  int contador = 0;
  bool kindActivity = false;
  BuildContext _context;
  double ancho;

  // atributos que dan fucnionalidad del pomodoro
  int startState = 1;
  int tConcentracionseg = 0;
  int tDescansoSeg = 0;
  bool revisarTiempoCon = false;
  bool revisarTiempoDes = false;

  bool botonDeshabilitado = false;
  bool resetDeshabilitado = false;
  @override
  void initState() {
    super.initState();
    tiempoPantalla = '${widget.tConcentracion}';
    resetDeshabilitado = true;
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    this.ancho = MediaQuery.of(context).size.width;
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
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                _contadorquadoro(),
                SizedBox(
                  height: 20,
                ),
                _aquadoroStack(),
                Expanded(child: Container()),
                _botones(),
                Expanded(child: Container())
              ],
            ),
          )
        ],
      ));

  Widget _aquadoroStack() => Stack(
        children: [
          Container(
            width: 357,
            height: 357,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage('assets/Acuadoro.png'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 100,
            left: this.ancho * 0.25,
            child: Container(
              height: 100,
              width: 170,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      tipoActividad,
                      style:
                          TextStyle(fontSize: 25, color: Colors.blueGrey[50]),
                    ),
                  ),
                  Center(
                    child: Text(
                      tiempoPantalla,
                      style:
                          TextStyle(fontSize: 25, color: Colors.blueGrey[50]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _botones() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AbsorbPointer(
            child: _reset(),
            absorbing: resetDeshabilitado,
          ),
          AbsorbPointer(
            child: _focus(),
            absorbing: botonDeshabilitado,
          ),
        ],
      );

  Widget _reset() => RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.cyan[200],
        child: Row(
          children: [
            Text('Reset',
                style: TextStyle(fontSize: 25, color: Colors.teal[900])),
            Icon(
              Icons.rotate_left,
              size: 25,
              color: Colors.teal[900],
            ),
          ],
        ),
        onPressed: () {
          if (tConcentracionseg > 1) {
            revisarTiempoCon = true;
            startState = 1;
            print('Le diste en reset de focus');
          } else if (tDescansoSeg > 1) {
            revisarTiempoCon = true;
            startState = 1;
            kindActivity = false;
            tipoActividad = 'Focus';
            tiempoPantalla = '${widget.tConcentracion.toString()}';
            print('Le diste en reset de relax y te regresa a focus');
          }
        },
      );
  Widget _focus() => OutlineButton(
      borderSide: BorderSide(
          width: 3, color: Colors.blue[900], style: BorderStyle.solid),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Text(
            tipoActividad,
            style: TextStyle(fontSize: 25, color: Colors.indigo[800]),
          ),
          Icon((kindActivity) ? Icons.adjust : Icons.album,
              size: 25, color: Colors.blue[900]),
        ],
      ),
      onPressed: () {
        switch (startState) {
          case 1:
            setState(() {
              botonDeshabilitado = true;
              resetDeshabilitado = false;
            });
            tConcentracionseg = (widget.tConcentracion) * 60;
            Timer.periodic(Duration(seconds: 1), (t) {
              setState(() {
                if (tConcentracionseg < 1 || revisarTiempoCon) {
                  t.cancel();
                  revisarTiempoCon = false;
                  tiempoPantalla = '${widget.tConcentracion.toString()}';
                  botonDeshabilitado = false;
                  resetDeshabilitado = true;
                  if (tConcentracionseg < 1) {
                    startState = 2;
                    tipoActividad = "Relax";
                    kindActivity = true;
                    tiempoPantalla = '${widget.tRelax.toString()}';
                  }
                } else if (tConcentracionseg < 60) {
                  tiempoPantalla = '$tConcentracionseg';
                  tConcentracionseg--;
                } else {
                  int m = tConcentracionseg ~/ 60;
                  int s = tConcentracionseg - (60 * m);
                  tiempoPantalla = (s < 10) ? '$m:0$s' : '$m:$s';
                  tConcentracionseg--;
                }
              });
            });
            break;
          case 2:
            setState(() {
              botonDeshabilitado = true;
              resetDeshabilitado = false;
            });
            tDescansoSeg = (widget.tConcentracion) * 60;
            Timer.periodic(Duration(seconds: 1), (t) {
              setState(() {
                if (tDescansoSeg < 1 || revisarTiempoDes) {
                  t.cancel();
                  revisarTiempoDes = false;
                  tiempoPantalla = '${widget.tConcentracion.toString()}';
                  botonDeshabilitado = false;
                  resetDeshabilitado = true;
                  if (tDescansoSeg < 1) {
                    startState = 2;
                    tipoActividad = "Focus";
                    kindActivity = false;
                    tiempoPantalla = '${widget.tRelax.toString()}';
                  }
                } else if (tDescansoSeg < 60) {
                  tiempoPantalla = '$tDescansoSeg';
                  tDescansoSeg--;
                } else {
                  int m = tDescansoSeg ~/ 60;
                  int s = tDescansoSeg - (60 * m);
                  tiempoPantalla = (s < 10) ? '$m:0$s' : '$m:$s';
                  tDescansoSeg--;
                }
              });
            });
            break;
          case 3:
            setState(() {
              botonDeshabilitado = true;
              resetDeshabilitado = false;
            });
            tDescansoSeg = (30) * 60;
            Timer.periodic(Duration(seconds: 1), (t) {
              setState(() {
                if (tDescansoSeg < 1 || revisarTiempoDes) {
                  t.cancel();
                  revisarTiempoDes = false;
                  tiempoPantalla = '${widget.tConcentracion.toString()}';
                  botonDeshabilitado = false;
                  resetDeshabilitado = true;
                  if (tDescansoSeg < 1) {
                    startState = 2;
                    tipoActividad = "Focus";
                    kindActivity = false;
                    tiempoPantalla = '${widget.tRelax.toString()}';
                  }
                } else if (tDescansoSeg < 60) {
                  tiempoPantalla = '$tDescansoSeg';
                  tDescansoSeg--;
                } else {
                  int m = tDescansoSeg ~/ 60;
                  int s = tDescansoSeg - (60 * m);
                  tiempoPantalla = (s < 10) ? '$m:0$s' : '$m:$s';
                  tDescansoSeg--;
                }
              });
            });
            break;
        }
      });

  Widget _contadorquadoro() => (this.contador < 1 || this.contador > 5)
      ? Container(
          height: 35,
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _renglon(number: contador),
        );

  List<Widget> _renglon({int number = 1}) {
    List<Widget> tmp = [];
    for (int i = 0; i < number; i++) tmp.add(_reloj());
    return tmp;
  }

  Widget _reloj() => Icon(
        Icons.av_timer,
        color: Colors.teal[50],
        size: 45,
      );
}
