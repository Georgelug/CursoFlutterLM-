main() {
  //Formas para declarar variables
  var nombre = "Maria"; //String

  var numLista = 19; //entero
  //dynamic nos permite cambiar de manera dinamica el tipo de dato durante el runtime, por lo tanto se puede cambiar de un string a un entero sin ningun problema
  dynamic cambioDeTipo = "Es un mensaje";

  print(cambioDeTipo);

  cambioDeTipo = 12345;

  print(cambioDeTipo);

  /// Esto es una manera de comentar que se usa para dartdoc
  /// Para crea documentacion de nuestro codigo
  /// con ayuda de dartdoc
}
