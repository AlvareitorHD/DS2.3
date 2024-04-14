import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';

import '../constructor/constructor.dart';
import '../constructor/constructor_bicicleta_carretera.dart';
import '../constructor/constructor_bicicleta_decorada.dart';
import '../constructor/constructor_bicicleta_montana.dart';

class Director {
//Como el constructor es vacío no hace falta ponerlo.

  void hacerBicicletaMontana(Constructor? constructor) {
    if (constructor is ConstructorBicicletaMontana) {
      constructor.recomponer();
      constructor.construirManillar("RECTO");
      //Dart realiza "promoción de tipos" después de una comprobación con is,
      // permitiendo llamar a métodos específicos de la clase sin casting explícito.
      constructor.construirSuspension("ROSCADA", 1);
      constructor.construirFrenos("DISCO", 2);
      constructor.construirTransmision("SHIMANO");
      constructor.construirCuadro("ALUMINIO");
      constructor.construirSillin("SEMIRREDONDEADO");
      constructor.construirRuedas("OFF-ROAD", 2);
      constructor.asociarImagenBicicletaMontana();
    }
  }

  void hacerBicicletaCarretera(Constructor? constructor) {
    if (constructor is ConstructorBicicletaCarretera) {
      constructor.recomponer();
      constructor.construirManillar("ERGONÓMICO");
      constructor.construirFrenos("DISCO", 2);
      constructor.construirTransmision("SHIMANO");
      constructor.construirCuadro("FIBRA CARBONO");
      constructor.construirSillin("ESTRECHO");
      constructor.construirRuedas("ESCALADORAS", 2);
      constructor.asociarImagenBicicletaCarretera();
    }
  }

  void hacerBicicletaDecoradaConEstampado(Constructor? constructor) {
    if (constructor is ConstructorBicicletaDecorada) {
      constructor.agregarEstampado();
    }
  }

  void hacerBicicletaDecoradaConFunda(Constructor? constructor) {
    if (constructor is ConstructorBicicletaDecorada) {
      constructor.agregarFunda();
    }
  }
}
