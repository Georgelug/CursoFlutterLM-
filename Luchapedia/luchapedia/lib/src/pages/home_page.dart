import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luchapedia/src/pages/all_fighters.dart';

class HomePage extends StatelessWidget {
  String urlKemonito =
      'https://tolucalabellacd.com/wp-content/uploads/2020/03/Kemonito-manda-mensaje-ante-la-situaci%C3%B3n-del-coronavirus-805x603.jpg';
  String bioK =
      "Kemonito nacio el 3 de julio de 1967, es un icono de la lucha libre profecional mexicano, actualmente trabaja para la empresa Consejo Mundial de Lucha Libre (CMLL).";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _barrasuperior(),
        body: _principal(context),
      );
  Widget _barrasuperior() => AppBar(
        leading: Icon(Icons.directions_walk, size: 40),
        title: Text('LuchaPedia',
            style: TextStyle(fontSize: 30, color: Colors.amber[50])),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent[700],
      );

  Widget _principal(BuildContext context) => Stack(
        children: [
          Container(
            color: Colors.purpleAccent[700],
          ),
          Column(
            children: [
              Expanded(child: Container()),
              _luchadorBio(),
              Expanded(child: Container()),
              Text(
                'Mas Luchadores',
                style: TextStyle(
                    color: Color.fromRGBO(220, 229, 227, 0.9), fontSize: 29),
              ),
              Expanded(child: Container()),
              _listaluchadores(context),
              Expanded(child: Container()),
            ],
          )
        ],
      );

  // Biografia de Kemonito
  Widget _luchadorBio() => Center(
        child: Container(
          height: 385,
          width: 350,
          // decoration: BoxDecoration(
          //     color: Colors.indigo[500],
          //     borderRadius: BorderRadius.circular(40)),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(urlKemonito),
                width: 350,
                height: 350,
              ),
              Positioned(
                top: 155,
                left: 30,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_vermas(), SizedBox(width: 30), _megusta()],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  Widget _vermas() => FlatButton(
      onPressed: () {},
      child: Text('Ver mas', style: TextStyle(fontSize: 18)),
      color: Colors.teal[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)));
  Widget _megusta() => FlatButton(
      color: Colors.pink[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      onPressed: () {},
      child: Row(
        children: [Text('Me gusta'), Icon(Icons.favorite_border)],
      ));
  // Lista de mas luchadores
  Widget _listaluchadores(BuildContext context) => Center(
        child: Container(
          height: 120,
          width: 380,
          child: _lista(context),
        ),
      );
  Widget _lista(BuildContext context) => ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _item(
              direccion: 'assets/luchadores/elSanto.jpg',
              nombre: 'El Santo',
              textcolor: Colors.amber),
          _item(
              direccion: 'assets/luchadores/Angelica.png',
              nombre: 'Angelica',
              textcolor: Colors.purple[50]),
          _item(
              direccion: 'assets/luchadores/blueDemon.jpg',
              nombre: 'BlueDemon',
              textcolor: Colors.lightBlue[100]),
          _item(
              direccion: 'assets/luchadores/ladyShani.png',
              nombre: 'Lady Chany',
              textcolor: Colors.pink[300]),
          _item(
              direccion: 'assets/luchadores/historico.jpg',
              nombre: 'Historico',
              textcolor: Colors.grey[300]),
          _item(
              direccion: 'assets/luchadores/diosaQuetzal.png',
              nombre: 'Diosa Quetzal',
              textcolor: Colors.teal[200]),
          _item(
              direccion: 'assets/luchadores/frijolito.jpg',
              nombre: 'Frijolito',
              textcolor: Colors.lime),
          _item(
              direccion: 'assets/luchadores/tiniebla.png',
              nombre: 'Tiniebla',
              textcolor: Colors.grey),
          _masLuchadores(context)
        ],
      );
  Widget _item(
          {String direccion, String nombre, Color textcolor = Colors.white}) =>
      Container(
        margin: EdgeInsets.all(5),
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(direccion),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.only(top: 65, left: 2),
          child: Text(
            nombre,
            style: TextStyle(
                fontSize: 18, color: textcolor, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget _masLuchadores(BuildContext context) => Container(
      margin: EdgeInsets.all(5),
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/luchadores/masLuchadores.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: IconButton(
            icon: Icon(Icons.add_circle_outline,
                color: Colors.lightGreenAccent[400], size: 80),
            onPressed: () {
              print('Mas luchadores');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AllFighters()));
            }),
      ));
}
