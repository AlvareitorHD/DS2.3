import '../Bicicleta/Bicicleta.dart';

abstract class Constructor {

  // Se usa el operador ? para indicar que bicicleta puede ser null.
  Bicicleta? bicicleta;

  Constructor() {
    this.bicicleta = null;
  }

  void recomponer();

  // En caso de que sea null la bicicleta, no se hará nada evitando errores.
  void construirManillar(String tipo) {
    bicicleta?.establecerManillar(tipo);
  }

  void construirFrenos(String tipo, int cantidad) {
    bicicleta?.establecerFrenos(tipo, cantidad);
  }

  void construirTransmision(String tipo) {
    bicicleta?.establecerTransmision(tipo);
  }

  void construirCuadro(String tipo) {
    bicicleta?.establecerCuadro(tipo);
  }

  void construirSillin(String tipo) {
    bicicleta?.establecerSillin(tipo);
  }

  void construirRuedas(String tipo, int cantidad) {
    bicicleta?.establecerRuedas(tipo, cantidad);
  }

  Bicicleta? obtenerResultado() {
    return (bicicleta);
  }
}
