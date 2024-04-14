import 'constructor.dart';
import '../bicicleta/bicicleta_carretera.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

class ConstructorBicicletaCarretera extends Constructor {

  ConstructorBicicletaCarretera() {
    bicicleta = BicicletaCarretera();
  }

  /// Asocia una imagen con la representación interna de la bicicleta de
  /// carretera
  void asociarImagenBicicletaCarretera() {
    bicicleta?.asociarImagen(BICI_CAR);
  }

  @override
  void recomponer() {
    bicicleta = BicicletaCarretera();
  }
}
