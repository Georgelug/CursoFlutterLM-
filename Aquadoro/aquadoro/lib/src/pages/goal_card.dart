import 'package:flutter/material.dart';
import 'package:aquadoro/src/pages/aquadorop_page.dart';

class GoalCard extends StatefulWidget {
  String actividad;
  int tConcentracion;
  int tRelax;

  final AnimationController animationController;

  //Contructor
  GoalCard({this.animationController});

  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  double anchoPantalla;
  @override
  Widget build(BuildContext context) {
    anchoPantalla = MediaQuery.of(context).size.width;
    return SizeTransition(
      axisAlignment: 0.0,
      sizeFactor: CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.linear,
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(223, 255, 255, 1),
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _elemento(item: _actividadInput(), porcentaje: 0.45),
              Spacer(),
              _elemento(item: _inputConcentracion(), porcentaje: 0.15),
              Spacer(),
              _elemento(item: _inputDescanso(), porcentaje: 0.15),
              Spacer(),
              _botonFlecha()
            ],
          ),
        ),
      ),
    );
  }

  String initialActivity() =>
      (widget.actividad == null) ? " " : "${widget.actividad.toString()}";

  String initialFocus() => (widget.tConcentracion == null)
      ? " "
      : "${widget.tConcentracion.toString()}";

  String initialRelax() =>
      (widget.tRelax == null) ? " " : "${widget.tRelax.toString()}";

  Widget _elemento({Widget item, double porcentaje}) => Container(
        padding: EdgeInsets.only(left: 10, bottom: 13),
        child: item,
        width: anchoPantalla * porcentaje,
      );

  Widget _actividadInput() => TextFormField(
        initialValue: initialActivity(),
        decoration: InputDecoration(
          labelText: 'Actividad',
          labelStyle: TextStyle(fontSize: 13),
        ),
        onChanged: (activity) {
          widget.actividad = activity;
          print(widget.actividad);
        },
      );

  Widget _inputConcentracion() => TextFormField(
        initialValue: initialFocus(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Focus',
          labelStyle: TextStyle(fontSize: 13),
        ),
        onChanged: (tiempoconcentracion) {
          widget.tConcentracion = double.parse(tiempoconcentracion).toInt();
          print(widget.tConcentracion);
        },
      );

  Widget _inputDescanso() => TextFormField(
        initialValue: initialRelax(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Relax',
          labelStyle: TextStyle(fontSize: 13),
        ),
        onChanged: (tiempoDescanso) {
          widget.tRelax = double.parse(tiempoDescanso).toInt();
          print(widget.tRelax);
        },
      );

  Widget _botonFlecha() => Container(
        margin: EdgeInsets.only(top: 10),
        width: anchoPantalla * 0.13,
        child: FlatButton(
            onPressed: () {
              print('Navegando');
              if ((widget.actividad != null) &&
                  (widget.tConcentracion != null) &&
                  (widget.tRelax != null)) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Aquadoro(
                          actividad: widget.actividad,
                          tConcentracion: widget.tConcentracion,
                          tRelax: widget.tRelax,
                        )));
              } else {
                print('algo malo ha sucedio');
              }
            },
            child: Icon(
              Icons.arrow_forward_ios,
              size: anchoPantalla * 0.1,
              color: Colors.cyan[700],
            )),
      );
}
