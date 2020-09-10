import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String urlKemonito =
      'https://tolucalabellacd.com/wp-content/uploads/2020/03/Kemonito-manda-mensaje-ante-la-situaci%C3%B3n-del-coronavirus-805x603.jpg';
  String bioK =
      "Kemonito nacio el 3 de julio de 1967, es un icono de la lucha libre profecional mexicano, actualmente trabaja para la empresa Consejo Mundial de Lucha Libre (CMLL).";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _barrasuperior(),
        body: _principal(),
      );
  Widget _barrasuperior() => AppBar(
        leading: Icon(Icons.directions_walk, size: 40),
        title: Text('LuchaPedia',
            style: TextStyle(fontSize: 30, color: Colors.amber[50])),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent[700],
      );

  Widget _principal() => Stack(
        children: [
          Container(
            color: Colors.purpleAccent[700],
          ),
          Column(
            children: [
              _luchadorBio(),
            ],
          )
        ],
      );

  // Biografia de Kemonito
  Widget _luchadorBio() => Center(
        child: Container(
          height: 385,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.indigo[500],
              borderRadius: BorderRadius.circular(40)),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(urlKemonito),
                width: 350,
                height: 350,
              ),
              Positioned(
                top: 155,
                left: 20,
                child: Container(
                  width: 310,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.indigo[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Kemonito',
                        style:
                            TextStyle(fontSize: 28, color: Colors.yellow[200]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          bioK,
                          style:
                              TextStyle(fontSize: 16, color: Colors.yellow[50]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
