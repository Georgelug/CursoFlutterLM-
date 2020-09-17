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

  BuildContext _context;
  double ancho;

  @override
  void initState() {
    super.initState();
    tiempoPantalla = '${widget.tConcentracion}';
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
        children: [_reset(), _focus()],
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
        onPressed: () {},
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
          Icon(Icons.adjust, size: 25, color: Colors.blue[900]),
        ],
      ),
      onPressed: () {});
}
