import '../Constructores/constructor.dart';
import '../Constructores/constructorBicicletaCarretera.dart';
import '../Constructores/constructorBicicletaDecorada.dart';
import '../Constructores/constructorBicicletaMontana.dart';

class Director {
//Como el constructor es vacío no hace falta ponerlo.

  void hacerBicicletaMontana(Constructor constructor) {
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
    }
  }

  void hacerBicicletaCarretera(Constructor constructor) {
    if (constructor is ConstructorBicicletaCarretera) {
      constructor.recomponer();
      constructor.construirManillar("ERGONÓMICO");
      constructor.construirFrenos("DISCO", 2);
      constructor.construirTransmision("SHIMANO");
      constructor.construirCuadro("FIBRA CARBONO");
      constructor.construirSillin("ESTRECHO");
      constructor.construirRuedas("ESCALADORAS", 2);
    }
  }

  void hacerBicicletaDecorada(Constructor constructor) {
    if (constructor is ConstructorBicicletaDecorada) {
      constructor.agregarEstampado();
      constructor.agregarFunda();
    }
  }
}
