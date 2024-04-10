import 'constructor.dart';
import '../Bicicleta/BicicletaCarretera.dart';

class ConstructorBicicletaCarretera extends Constructor {

  ConstructorBicicletaCarretera() {
    bicicleta = BicicletaCarretera();
  }

  @override
  void recomponer() {
    bicicleta = BicicletaCarretera();
  }
}
