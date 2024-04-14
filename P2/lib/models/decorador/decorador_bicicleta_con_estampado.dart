import 'decorador_bicicleta.dart';
import '../bicicleta/bicicleta.dart';

import '../bicicleta/bicicleta_montana.dart';

/**
 * Clase que hereda de DecoradorBicicleta, la cual representa el decorador que añade un estampado a una bicicleta
 */
class DecoradorBicicletaConEstampado extends DecoradorBicicleta {

  /**
   * Constructor de la clase. Llama al constructor de la superclase para establecer la bicicleta sobre la que trabajar
   * y, además, le añade el extra decorativo; en este caso particular, un estampado
   * @param bicicletaADecorar Bicicleta de base sobre la que aplicar las decoraciones
   */
  DecoradorBicicletaConEstampado(Bicicleta? bicicletaDecorada) : super(bicicletaDecorada) {
    this.extra = "ESTAMPADO";
  }

  /**
   * Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta del tipo que sea con
   * estampado está avanzando
   */
  @override
  void avanzar() {
    print("\nLa bicicleta con estampado está avanzando...");
  }

}