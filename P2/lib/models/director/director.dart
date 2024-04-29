import '../constructor/constructor.dart';
import '../constructor/constructor_bicicleta_carretera.dart';
import '../constructor/constructor_bicicleta_decorada.dart';
import '../constructor/constructor_bicicleta_montana.dart';

/// Clase Director que se encarga de construir las bicicletas con los constructores
class Director {
  /// Método que construye una bicicleta de montaña
  void hacerBicicletaMontana(Constructor? constructor) {
    if (constructor is ConstructorBicicletaMontana) {
      constructor.recomponer();
      constructor.construirManillar("RECTO");
      constructor.construirSuspension("ROSCADA", 1);
      constructor.construirFrenos("DISCO", 2);
      constructor.construirTransmision("SHIMANO");
      constructor.construirCuadro("ALUMINIO");
      constructor.construirSillin("SEMIRREDONDEADO");
      constructor.construirRuedas("OFF-ROAD", 2);
      constructor.asociarImagenBicicleta();
    }
  }

  /// Método que construye una bicicleta de montaña
  void hacerBicicletaCarretera(Constructor? constructor) {
    if (constructor is ConstructorBicicletaCarretera) {
      constructor.recomponer();
      constructor.construirManillar("ERGONÓMICO");
      constructor.construirFrenos("DISCO", 2);
      constructor.construirTransmision("SHIMANO");
      constructor.construirCuadro("FIBRA_CARBONO");
      constructor.construirSillin("ESTRECHO");
      constructor.construirRuedas("ESCALADORAS", 2);
      constructor.asociarImagenBicicleta();
    }
  }

  /// Método que construye una bicicleta decorada con estampado
  void hacerBicicletaDecoradaConEstampado(Constructor? constructor) {
    if (constructor is ConstructorBicicletaDecorada) {
      constructor.agregarEstampado();
      constructor.asociarImagenBicicleta();
    }
  }

  /// Método que construye una bicicleta decorada con funda
  void hacerBicicletaDecoradaConFunda(Constructor? constructor) {
    if (constructor is ConstructorBicicletaDecorada) {
      constructor.agregarFunda();
      constructor.asociarImagenBicicleta();
    }
  }
}
