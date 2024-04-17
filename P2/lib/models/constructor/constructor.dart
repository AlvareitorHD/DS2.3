import '../bicicleta/bicicleta.dart';
import 'package:meta/meta.dart';

/// Define un constructor abstracto para bicicletas.
/// 
/// Esta clase provee la base para construir diferentes partes de una bicicleta
/// permitiendo la personalización según el tipo de bicicleta.
abstract class Constructor {

  /// La bicicleta en construcción. Puede ser `null` si la construcción no ha empezado.
  @protected
  Bicicleta? bicicleta;

  /// Constructor base para [Constructor].
  Constructor();

  /// Método abstracto para recomponer la bicicleta.
  void recomponer();

  /// Construye el manillar de la bicicleta con el [tipo] especificado.
  void construirManillar(String tipo) {
    bicicleta?.establecerManillar(tipo);
  }

  /// Construye los frenos de la bicicleta con el [tipo] y [cantidad] especificados.
  void construirFrenos(String tipo, int cantidad) {
    bicicleta?.establecerFrenos(tipo, cantidad);
  }

  /// Construye la transmisión de la bicicleta con el [tipo] especificado.
  void construirTransmision(String tipo) {
    bicicleta?.establecerTransmision(tipo);
  }

  /// Construye el cuadro de la bicicleta con el [tipo] especificado.
  void construirCuadro(String tipo) {
    bicicleta?.establecerCuadro(tipo);
  }

  /// Construye el sillín de la bicicleta con el [tipo] especificado.
  void construirSillin(String tipo) {
    bicicleta?.establecerSillin(tipo);
  }

  /// Construye las ruedas de la bicicleta con el [tipo] y [cantidad] especificados.
  void construirRuedas(String tipo, int cantidad) {
    bicicleta?.establecerRuedas(tipo, cantidad);
  }

  /// Obtiene la bicicleta construida. Retorna `null` si la construcción no ha empezado.
  Bicicleta? obtenerResultado() => bicicleta;
}
