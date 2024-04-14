// Importaciones de bibliotecas:
import 'package:flutter/material.dart';



/// Clase que representa un widget de una etiqueta de texto
class EtiquetaTexto extends StatelessWidget {
  /// Texto de la etiqueta
  String _texto;

  /// Tamaño de la fuente
  final double? _tamanioFuente;

  /// Estilo de la fuente
  final FontWeight? _estiloFuente;

  /// Color del texto
  final Color? _color;

  /// Constructor de la clase
  EtiquetaTexto(this._texto, this._tamanioFuente, this._estiloFuente,
      this._color);

  /// Método sobreescrito para construir la representación visual del widget
  /// (se define la interfaz de usuario del widget)
  /// @param context Objeto con información sobre la ubicación del widget en el
  /// árbol de widgets
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _texto,
          style: TextStyle(
            fontSize: _tamanioFuente, // Tamaño de la fuente
            fontWeight: _estiloFuente, // Peso de la fuente
            color: _color, // Color del texto
          ),
        ),
      ],
    );
  }
}

/// Función para crear una etiqueta de texto haciendo uso de la clase
/// 'EtiquetaTexto'
Widget crearEtiquetaTexto(
    String texto,
    double? tamanioFuente,
    FontWeight? estiloFuente,
    Color? color) {
  return EtiquetaTexto(texto, tamanioFuente, estiloFuente, color);
}