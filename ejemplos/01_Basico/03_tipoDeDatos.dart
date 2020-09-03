/*
Este archivo contendra los tipos de variables que podemos usar
en dart
*/
main() {
  // Numeros, se pueden declarar como tracionalmente se hace, con var o con dynamic, solo que en estos dos caso se necesita especificar si es flotante o entero
  int numInt = 10;

  double numDecimal = 10;

  var numVarInt = 10;

  var numDouble = 10.0;

  print("\nnumInt= $numInt\nnumDecimal= $numDecimal");

  // Strings
  String nombre = "Jorge",
      nombre2 =
          'Maria'; //las strings se pueden declarar con comillas simples o dobles

  // Una cadena multilinea se declara con triple comillas (simples o dobles) y sirve para cuando se requiera que se respete los espacios y los saltos de linea
  String cadenaMultilinea = """Hola Mundo,
  como les va en la cuarentena
  """;
  print(cadenaMultilinea);
  // Booleanos
  bool paseElSemestre = true;
  bool hagoEjercicio;
  print("$paseElSemestre\n$hagoEjercicio");

  // Listas-arreglos, Nota: las listas SI aceptan elementos iguales esto es lo que diferencia entre una lista y un set
  List<String> frases = ["Hola", "Mundo", "quiero", "Chelear"];
  print(frases);
  List<String> personajes =
      new List(); //Asi se inicializa una lista de tamaño dinamico
  print(personajes);

  // para insertar elementos a una lista usamos .add()
  personajes.add("Dead Pool");
  personajes.add("Thor");
  print(personajes);

  // para agregar mas de un elemento a la lista se usa .addAll() el cual recibe como parametro una lista de elementos
  personajes.addAll(["Arenita", "Gary"]);
  print(personajes);

  //Para crear una lista con un tamaño establecido, se le agrega como parametro al constructor, el numero del tamaño de la lista al momento de instanciar el objeto List

  List<String> bebidas = new List(
      2); //nota: no se puede utilizar el metodo addAll() por que lo que se hace es hacer una lista de tamaño n de nulls

  bebidas[0] = 'agua';
  bebidas[1] = 'cerveza';
  print(bebidas);

  // Sets, se declaran entre llaves

  Set<String> bebidas2 = {'Agua', 'Vino', 'Cerveza'};

  bebidas2.add('Tequila');

  print(bebidas2);

  // Mapas, tambien se conocen como diccionarios u objetos.
  // Tiene una llave y un valor
  Map<String, String> datoPersona = {
    'Nombre': 'Jorge',
    "ApellidoPaterno": 'Esparza',
    'ColorFavorito': 'Azul',
  };
  print(datoPersona[
      'ColorFavorito']); //para acceder al valor de la llave es el <NombreDelMap>[Key]

  //Para crear Maps que no solo tengan valores de un solo tipo,

  Map<String, dynamic> infoEscuela = {
    'Nombre': 'Facultad de ingenieria',
    'numAlumnos': 12000,
    'NoCarreras': 15,
    'Carreras': {
      'Computacion',
      'Geofisica',
      'Civil',
      'Mecatronica',
      'Mecanica'
    },
  };
  print(infoEscuela);

  //Otra forma para crear mapas

  Map<String, dynamic> superHeroe = new Map();
  print(superHeroe);

  //Agregando elementos
  superHeroe.addAll(
      {'nombre': 'Bruce Banner', 'superPoder': 'Romper cosas', 'altura': 3.0});
  print(superHeroe);

  // final y const

  var x = 19;
  final y =
      19; //final no permite volverle a agregar otro valor, se usa cuando el valor se conoce en tiempo de ejecucion
  const z = 19; //se usa para cuando el valor se conoce en tiempo de compilacion
}
