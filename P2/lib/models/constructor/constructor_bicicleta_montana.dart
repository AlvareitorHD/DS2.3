import 'constructor.dart';
import '../bicicleta/bicicleta_montana.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

/// Clase que extiende [Constructor] para especializarse en la construcción
/// de bicicletas de montaña.
class ConstructorBicicletaMontana extends Constructor {
  /// Crea una instancia de [ConstructorBicicletaMontana] e inicializa
  /// la bicicleta como una nueva [BicicletaMontana].
  ConstructorBicicletaMontana(
      {required String tipoManillar,
        required String tipoFrenos,
        required int numFrenos,
        required String tipoTransmision,
        required String tipoCuadro,
        required String tipoSillin,
        required String tipoRuedas,
        required int numRuedas,
        required String imagenRepresentativa,
        required String tipoBicicleta,
        required String tipoSuspension,
        required int numSuspensiones}
      ) : super() {
    bicicleta = BicicletaMontana(
        tipoManillar: tipoManillar,
        tipoFrenos: tipoFrenos,
        numFrenos: numFrenos,
        tipoTransmision: tipoTransmision,
        tipoCuadro: tipoCuadro,
        tipoSillin: tipoSillin,
        tipoRuedas: tipoRuedas,
        numRuedas: numRuedas,
        imagenRepresentativa: imagenRepresentativa,
        tipoBicicleta: tipoBicicleta,
        tipoSuspension: tipoSuspension,
        numSuspensiones: numSuspensiones
    );
  }

  /// Asocia una imagen con la representación interna de la bicicleta de montaña.
  /// Utiliza una constante predefinida `BICI_MON` para esta asociación.
  @override
  void asociarImagenBicicleta() {
    bicicleta.asociarImagen(BICI_MON);
  }

  /// Construye la suspensión de la bicicleta de montaña con el [tipo] y
  /// [cantidad] especificados. Solo realiza la operación si `bicicleta` es
  /// efectivamente una instancia de [BicicletaMontana].
  void construirSuspension(String tipo, int cantidad) {
    if (bicicleta is BicicletaMontana) {
      (bicicleta as BicicletaMontana).establecerSuspension(tipo, cantidad);
    }
  }

  @override
  /// Reconstruye `bicicleta` asignándole una nueva instancia de [BicicletaMontana],
  /// permitiendo la reconfiguración de la bicicleta de montaña.
  void recomponer() => bicicleta = BicicletaMontana(
      tipoManillar: "",
      tipoFrenos: "",
      numFrenos: 0,
      tipoTransmision: "",
      tipoCuadro: "",
      tipoSillin: "",
      tipoRuedas: "",
      numRuedas: 0,
      imagenRepresentativa: "",
      tipoBicicleta: "",
      tipoSuspension: "",
      numSuspensiones: 0
  );
}
