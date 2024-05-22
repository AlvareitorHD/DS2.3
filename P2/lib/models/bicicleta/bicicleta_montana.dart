import 'bicicleta.dart';

// Clase hija de Bicicleta. Esta representa a una bicicleta de montaña
class BicicletaMontana extends Bicicleta {
  // Tipo de suspensión
  late String _tipoSuspension;

  // Número de suspensiones
  late int _numSuspensiones;

  // Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
  // por defecto los componentes de la bicicleta, además de inicializar los propios a valores por defecto
  BicicletaMontana({String tipoSuspension = '', int numSuspensiones = 0}) {
    _tipoSuspension = tipoSuspension;
    _numSuspensiones = numSuspensiones;
    tipoBicicleta = "montana";
  }

  // Getters:
  String get tipoSuspension => _tipoSuspension; // Getters:
  int get numSuspensiones => _numSuspensiones;

  // Modificador de la suspensión
  void establecerSuspension(String tipo, int num) {
    _tipoSuspension = tipo;
    _numSuspensiones = num;
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
        "\tTipo de suspensión: $_tipoSuspension\n" +
        "\tNúmero de suspensiones: $_numSuspensiones\n" +
        "\tTIPO DE BICICLETA: montaña\n");
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json['tipo_suspension'] = tipoSuspension as String?;
    json['num_suspensiones'] = numSuspensiones as int?;
    return json;
  }
}
