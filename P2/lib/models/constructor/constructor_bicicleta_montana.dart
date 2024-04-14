import 'constructor.dart';
import '../bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

class ConstructorBicicletaMontana extends Constructor {
  ConstructorBicicletaMontana() {
    bicicleta = BicicletaMontana();
  }

  /// Asocia una imagen con la representación interna de la bicicleta de montaña
  void asociarImagenBicicletaMontana() {
    bicicleta?.asociarImagen(BICI_MON);
  }

  void construirSuspension(String tipo, int cantidad) {
    // Dart no permite la conversión de tipos como en Java. En su lugar,
    // puedes usar 'as' para castear, asegurándote primero de que no sea null.
    // Usa is para el instanceof
    if (bicicleta is BicicletaMontana) {
      (bicicleta as BicicletaMontana).establecerSuspension(tipo, cantidad);
    }
  }

  @override
  void recomponer() {
    bicicleta = BicicletaMontana();
  }
}
