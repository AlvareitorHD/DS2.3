import 'constructor.dart';
import '../bicicleta/bicicleta_carretera.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

/// Clase que extiende [Constructor] para especializarse en la construcción
/// de bicicletas de carretera.
class ConstructorBicicletaCarretera extends Constructor {
  
  /// Crea una instancia de [ConstructorBicicletaCarretera] e inicializa
  /// la bicicleta como una nueva [BicicletaCarretera].
  ConstructorBicicletaCarretera() : super() {
    bicicleta = BicicletaCarretera();
  }

  /// Asocia una imagen con la representación interna de la bicicleta de
  /// carretera
  void asociarImagenBicicletaCarretera() {
    bicicleta?.asociarImagen(BICI_CAR);
  }

  @override

  /// Reconstruye `bicicleta` asignándole una nueva instancia de [BicicletaCarretera],
  /// permitiendo la reconfiguración de la bicicleta de carretera.
  void recomponer() => bicicleta = BicicletaCarretera();
}
