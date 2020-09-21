import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flare_flutter/flare_actor.dart';

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

  String animacionActual = 'Reset';
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
      // appBar: _barraSuperior(),
      body: _cuerpo(),
    );
  }

  Widget _barraSuperior() => AppBar(
        title: Text('Aquadoro'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      );

  Widget _cuerpo() => Stack(
        children: [
          _fondopomodoro(),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  _nuestraAppBar(context),
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
            ),
          )
        ],
      );

  Widget _aquadoroStack() => Stack(
        children: [
          Container(width: 400, height: 400, child: _animacion()),
          Positioned(
            top: 170,
            left: this.ancho * 0.28,
            child: Container(
              height: 100,
              width: 170,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      tipoActividad,
                      style: GoogleFonts.overpass(
                          fontSize: 25, color: Colors.blueGrey[50]),
                    ),
                  ),
                  Center(
                    child: Text(
                      tiempoPantalla,
                      style: GoogleFonts.overpass(
                          fontSize: 25, color: Colors.blueGrey[50]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _animacion() => FlareActor(
        'assets/aquadoroo.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: animacionActual,
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
                style: GoogleFonts.overpass(
                    fontSize: 25, color: Colors.teal[900])),
            Icon(
              Icons.rotate_left,
              size: 25,
              color: Colors.teal[900],
            ),
          ],
        ),
        onPressed: () {
          animacionActual = "Reset";
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
            style:
                GoogleFonts.overpass(fontSize: 25, color: Colors.indigo[800]),
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
              animacionActual = "loopFocus";
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
                    if (contador == 4) {
                      _mostrarAlerta(context);
                      contador = 5;
                      tiempoPantalla = '${30}';
                    } else {
                      tiempoPantalla = '${widget.tRelax}';
                    }
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
                if (tConcentracionseg < 11) {
                  animacionActual = 'FinFocus';
                }
              });
            });
            break;
          case 2:
            setState(() {
              botonDeshabilitado = true;
              resetDeshabilitado = false;
              animacionActual = "loopRelax";
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
                  if (tConcentracionseg < 1) {
                    startState = 1;
                    tipoActividad = "Focus";
                    kindActivity = false;
                    tiempoPantalla = '${widget.tRelax.toString()}';
                    if (contador < 4) {
                      contador++;
                    }
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
                if (tDescansoSeg < 11) {
                  animacionActual = "FinRelax";
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
                  if (tConcentracionseg < 1) {
                    startState = 1;
                    tipoActividad = "Focus";
                    kindActivity = false;
                    tiempoPantalla = '${widget.tRelax.toString()}';
                    contador = 0;
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

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.teal[200],
              elevation: 25,
              title: Text(
                '\t\t\t\tFelicidades',
                style:
                    GoogleFonts.overpass(fontSize: 30, color: Colors.blue[900]),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Has realizado 5 pomodoros seguidos',
                    style: GoogleFonts.overpass(
                        fontSize: 20.5, color: Colors.indigo[900]),
                  ),
                  Text(
                    'Te recomendamos divifir esta meta en una mas pequeña para disminuir la carga',
                    style: GoogleFonts.overpass(
                        fontSize: 20, color: Colors.indigo[900]),
                  ),
                  Text(
                    "¿Nos tomamos un descanso de 30 minutos?",
                    style: GoogleFonts.overpass(
                        fontSize: 20, color: Colors.indigo[900]),
                  ),
                  Image.asset(
                    'assets/AlertImage.png',
                    fit: BoxFit.cover,
                    height: 170,
                  ),
                ],
              ),
              actions: [
                _buttonAlert(
                  instruction: 'Subdividir',
                  func: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  gradeColor: 800,
                ),
                _buttonAlert(
                  instruction: 'Descansar',
                  func: () {
                    Navigator.pop(context);
                    setState(() {
                      startState = 3;
                      print('Se mando al StartState 3');
                    });
                  },
                  gradeColor: 800,
                ),
              ],
            ));
  }

  Widget _buttonAlert({dynamic func, int gradeColor, String instruction}) =>
      FlatButton(
          onPressed: func,
          child: Text(
            instruction,
            style: GoogleFonts.overpass(
                fontSize: 24, color: Colors.lightBlue[gradeColor]),
          ));

  Widget _nuestraAppBar(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _returnButton(),
          _actividad(),
          Expanded(child: Container()),
        ],
      );
  Widget _returnButton() => Container(
        width: 40,
        child: FlatButton(
          padding: EdgeInsets.only(right: 10, top: 10),
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Colors.cyan[100],
          ),
        ),
      );
  Widget _actividad() => Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            widget.actividad,
            style: GoogleFonts.overpass(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.cyan[50]),
          ),
        ),
      );

  Widget _fondopomodoro() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.cyan[400],
          Colors.cyan[800],
        ])),
      );
}
