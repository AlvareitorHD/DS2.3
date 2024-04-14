import 'bicicleta.dart';

// Clase hija de Bicicleta. Esta representa a una bicicleta de montaña
class BicicletaMontana extends Bicicleta {
  // Tipo de suspensión
  late String tipoSuspension;

  // Número de suspensiones
  late int numSuspensiones;

  // Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
  // por defecto los componentes de la bicicleta, además de inicializar los propios a valores por defecto
  BicicletaMontana() : super();

  // Modificador de la suspensión
  void establecerSuspension(String tipo, int num) {
    tipoSuspension = tipo;
    numSuspensiones = num;
  }

  // Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta de montaña está
  // avanzando
  @override
  void avanzar() {
    print("\nLa bicicleta de montaña está avanzando...");
  }

  // Sobreescritura del método 'toString' para representar la información de la bicicleta. Llama al de la superclase
  // para contar con la información general de la bicicleta y, además, le añade información específica de este tipo
  // de bicicleta
  @override
  String toString() {
    return (super.toString() +
        "\tTipo de suspensión: $tipoSuspension\n" +
        "\tNúmero de suspensiones: $numSuspensiones\n" +
        "\tTIPO DE BICICLETA: montaña\n");
  }
}
