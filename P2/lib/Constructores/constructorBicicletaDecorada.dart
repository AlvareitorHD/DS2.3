import 'constructor.dart';
import '../Bicicleta/Bicicleta.dart';
import '../Decorador/decoradorBicicletaConEstampado.dart';
import '../Decorador/decoradorBicicletaConFunda.dart';


class ConstructorBicicletaDecorada extends Constructor {
  ConstructorBicicletaDecorada(Bicicleta bicicleta) {
    this.bicicleta = bicicleta;
  }

  void agregarEstampado() {
    if (bicicleta != null) {
      bicicleta = DecoradorBicicletaConEstampado(bicicleta!);
    }
  }

  void agregarFunda() {
    if (bicicleta != null) {
      bicicleta = DecoradorBicicletaConFunda(bicicleta!);
    }
  }

  @override
  void recomponer() {
    bicicleta = null;
  }
}
