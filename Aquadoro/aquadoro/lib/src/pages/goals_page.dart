import 'package:aquadoro/src/pages/goal_card.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  GoalspageState createState() => GoalspageState();
}

class GoalspageState extends State<GoalsPage> with TickerProviderStateMixin {
  BuildContext _context;
  double anchoPantalla;
  List<String> textoBarra = [
    "¿Qué es lo realmente\nimportante?",
    "Vamos a\nhacerlo c:",
    "¿Qué has estado dejando\npendiente?"
  ];
  List<GoalCard> _metas = [];
  int index;
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpo(),
    );
  }

  Widget _barraSuperior() => AppBar(
        title: _fadeText(texto: textoBarra),
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
              _listaScrolleable(),
              _botonagregar(),
              Container(
                height: 30,
              ),
            ],
          )
        ],
      ));

  Widget _listaScrolleable() => Flexible(
          child: ListView.builder(
        itemBuilder: (_, int index) {
          return Dismissible(
            key: new UniqueKey(),
            child: _metas[index],
            background: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10),
              alignment: AlignmentDirectional.centerStart,
              color: Colors.deepOrange[700],
              child: Icon(
                Icons.delete,
                color: Colors.grey[100],
              ),
            ),
            onDismissed: (direccion) {
              setState(() {
                print("Index: ${_metas.length}");
                print(_metas[index].actividad);
                _metas.removeAt(index);
                // print("Despues de eliminar: ${_metas[index].actividad.toString()}");
              });
            },
          );
        },
        itemCount: _metas.length,
      ));

  Widget _botonagregar() => FloatingActionButton(
        onPressed: () {
          print("Index al presionar boton: ${this.index}");
          _agregarCard();
        },
        child: Icon(
          Icons.add_circle_outline,
          color: Colors.cyan[50],
          size: 50,
        ),
      );

  Widget _fadeText({List<String> texto}) => Container(
        margin: EdgeInsets.only(top: 5),
        child: SizedBox(
          width: 350.0,
          child: FadeAnimatedTextKit(
              repeatForever: true,
              text: texto,
              textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[50]),
              textAlign: TextAlign.center,
              alignment:
                  AlignmentDirectional.bottomCenter // or Alignment.topLeft
              ),
        ),
      );

  void _agregarCard() {
    final animacionCards = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    GoalCard meta = new GoalCard(
      animationController: animacionCards,
    );
    setState(() {
      _metas.insert(_metas.length, meta);
    });

    meta.animationController.forward();
  }

  @override
  void dispose() {
    for (GoalCard meta in _metas) meta.animationController.dispose();
    super.dispose();
  }
}
