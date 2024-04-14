// Importaciones de bibliotecas:
import 'package:flutter/material.dart';
// Importaciones de ficheros propios:
import 'screens/pantalla_factoria_bicicletas.dart';

/// Punto de entrada de la aplicación. La función 'runApp' recibe un widget como
/// argumento y lo coloca en la jerarquía de widgets de la aplicación
void main() {
  runApp(MyApp());
}

/// Clase que representa el widget raiz de la app en sí de la factoría de
/// bicicletas. Al heredar de 'StatelessWidget', se indica que 'MyApp' es un
/// widget en Flutter que no mantiene ningún estado mutable y, por lo tanto, no
/// cambia su apariencia o comportamiento una vez creado
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaFactoriaBicicletas(),
    );
  }
}
