import 'constructor.dart';
import '../Bicicleta/BicicletaMontana.dart';

class ConstructorBicicletaMontana extends Constructor {
  ConstructorBicicletaMontana() {
    bicicleta = BicicletaMontana();
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
