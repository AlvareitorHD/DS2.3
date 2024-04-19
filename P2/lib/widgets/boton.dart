// Importaciones de bibliotecas:
import 'package:flutter/material.dart';

/// Clase que representa un botón. Al heredar de 'StatelessWidget', se indica
/// que 'Boton' es un widget en Flutter que no mantiene ningún estado mutable y,
/// por lo tanto, no cambia su apariencia o comportamiento una vez creado
class Boton extends StatelessWidget {
  /// Texto autodescriptivo para cuando se sitúa el cursor encima
  final String _textoCursor;

  /// Texto del botón
  final String _texto;

  /// Color del texto del botón
  final Color _colorTexto;

  /// Color de fondo del botón
  final Color _colorFondo;

  /// Dimensión del botón
  final Size _tamanio;

  /// Función que ejecutará el botón al ser presionado
  final Function _onPressed;

  /// Constructor de la clase
  const Boton(this._textoCursor, this._texto, this._colorTexto, this._colorFondo,
      this._tamanio, this._onPressed, {super.key});

  /// Método sobreescrito para construir la representación visual del widget
  /// (se define la interfaz de usuario del widget)
  /// @param context Objeto con información sobre la ubicación del widget en el
  /// árbol de widgets
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _textoCursor,
      child: ElevatedButton(
        onPressed: () => _onPressed(),
        child: Text(_texto),
        style: ElevatedButton.styleFrom(
          foregroundColor: _colorTexto,
          backgroundColor: _colorFondo,
          fixedSize: _tamanio,
        ),
      ),
    );
  }
}

/// Función para crear un botón haciendo uso de la clase 'Boton'
Widget crearBoton(
    String textoCursor,
    String texto,
    Color colorTexto,
    Color colorFondo,
    Size tamanio,
    Function onPressed) {
  return (Boton(textoCursor, texto, colorTexto, colorFondo, tamanio, onPressed));
}