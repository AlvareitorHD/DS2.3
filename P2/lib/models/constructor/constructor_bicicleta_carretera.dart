import 'constructor.dart';
import '../bicicleta/bicicleta_carretera.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

/// Clase que extiende [Constructor] para especializarse en la construcción
/// de bicicletas de carretera.
class ConstructorBicicletaCarretera extends Constructor {
  /// Crea una instancia de [ConstructorBicicletaCarretera] e inicializa
  /// la bicicleta como una nueva [BicicletaCarretera].
  ConstructorBicicletaCarretera(
      {required String tipoManillar,
    required String tipoFrenos,
    required int numFrenos,
    required String tipoTransmision,
    required String tipoCuadro,
    required String tipoSillin,
    required String tipoRuedas,
    required int numRuedas,
    required String imagenRepresentativa,
    required String tipoBicicleta}) : super() {
    bicicleta = BicicletaCarretera(
        tipoManillar: tipoManillar,
        tipoFrenos: tipoFrenos,
        numFrenos: numFrenos,
        tipoTransmision: tipoTransmision,
        tipoCuadro: tipoCuadro,
        tipoSillin: tipoSillin,
        tipoRuedas: tipoRuedas,
        numRuedas: numRuedas,
        imagenRepresentativa: imagenRepresentativa,
        tipoBicicleta: tipoBicicleta);
  }

  /// Asocia una imagen con la representación interna de la bicicleta de
  /// carretera
  @override
  void asociarImagenBicicleta() {
    bicicleta?.asociarImagen(BICI_CAR);
  }

  @override

  /// Reconstruye `bicicleta` asignándole una nueva instancia de [BicicletaCarretera],
  /// permitiendo la reconfiguración de la bicicleta de carretera.
  void recomponer() => bicicleta = BicicletaCarretera(
      tipoManillar: "",
      tipoFrenos: "",
      numFrenos: 0,
      tipoTransmision: "",
      tipoCuadro: "",
      tipoSillin: "",
      tipoRuedas: "",
      numRuedas: 0,
      imagenRepresentativa: "",
      tipoBicicleta: "");
}
