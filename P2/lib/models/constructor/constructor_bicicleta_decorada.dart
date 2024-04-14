
import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

import 'constructor.dart';
import '../bicicleta/bicicleta.dart';


class ConstructorBicicletaDecorada extends Constructor {
  ConstructorBicicletaDecorada(Bicicleta? bicicleta) {
    this.bicicleta = bicicleta;
  }

  void agregarEstampado() {
    if (bicicleta != null) {
      bicicleta?.asociarImagen(
          (bicicleta is BicicletaMontana)
              ? BICI_MON_EST
              : BICI_CAR_EST);
    }
  }

  void agregarFunda() {
    if (bicicleta != null) {
      bicicleta?.asociarImagen(
          (bicicleta is BicicletaMontana)
              ? BICI_MON_FUN
              : BICI_CAR_FUN);
    }
  }

  @override
  void recomponer() {
    bicicleta = null;
  }
}
