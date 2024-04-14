// Importaciones de bibliotecas:
import 'package:flutter/material.dart';



/// Clase que representa un botón. Al heredar de 'StatelessWidget', se indica
/// que 'Boton' es un widget en Flutter que no mantiene ningún estado mutable y,
/// por lo tanto, no cambia su apariencia o comportamiento una vez creado
class Boton extends StatelessWidget {
  /// Texto autodescriptivo para cuando se sitúa el cursor encima
  final String _textCursor;

  /// Texto del botón
  final String _text;

  /// Color del texto del botón
  Color _foregroundColor;

  /// Color de fondo del botón
  Color _backgroundColor;

  /// Dimensión del botón
  Size _fixedSize;

  /// Función que ejecutará el botón al ser presionado
  Function _onPressed;

  /// Constructor de la clase
  Boton(this._textCursor, this._text, this._foregroundColor, this._backgroundColor,
      this._fixedSize, this._onPressed, {super.key});

  /// Método sobreescrito para construir la representación visual del widget
  /// (se define la interfaz de usuario del widget)
  /// @param context Objeto con información sobre la ubicación del widget en el
  /// árbol de widgets
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _textCursor,
      child: ElevatedButton(
        onPressed: () => _onPressed(),
        child: Text(_text),
        style: ElevatedButton.styleFrom(
          foregroundColor: _foregroundColor,
          backgroundColor: _backgroundColor,
          fixedSize: _fixedSize,
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