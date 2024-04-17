import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

import 'constructor.dart';
import '../bicicleta/bicicleta.dart';

/// Clase que extiende [Constructor] para especializarse en la construcción
/// de bicicletas decoradas.
class ConstructorBicicletaDecorada extends Constructor {
  /// Crea una instancia de [ConstructorBicicletaDecorada] e inicializa
  /// la bicicleta con el valor proporcionado, que puede ser `null`.
  ConstructorBicicletaDecorada(Bicicleta? bicicleta) : super() {
    this.bicicleta = bicicleta;
  }

  /// Agrega un estampado a la bicicleta, seleccionando la imagen apropiada
  /// basada en el tipo de bicicleta (montaña o carretera).
  void agregarEstampado() {
    bicicleta?.asociarImagen(
        bicicleta is BicicletaMontana ? BICI_MON_EST : BICI_CAR_EST);
  }

  /// Agrega una funda a la bicicleta, seleccionando la imagen apropiada
  /// basada en el tipo de bicicleta (montaña o carretera).
  void agregarFunda() {
    bicicleta?.asociarImagen(
        bicicleta is BicicletaMontana ? BICI_MON_FUN : BICI_CAR_FUN);
  }

  @override
  /// Reconstruye `bicicleta` asignándole el valor `null`.
  void recomponer() => bicicleta = null;
}
