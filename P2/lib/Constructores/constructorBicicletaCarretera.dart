import 'constructor.dart';

class ConstructorBicicletaCarretera extends Constructor {

  ConstructorBicicletaCarretera() {
    bicicleta = BicicletaCarretera();
  }

  @override
  void recomponer() {
    bicicleta = BicicletaCarretera();
  }
}
