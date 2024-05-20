import 'bicicleta.dart';

// Clase hija de Bicicleta. Esta representa a una bicicleta de montaña
class BicicletaMontana extends Bicicleta {
  // Tipo de suspensión
  late String tipoSuspension;

  // Número de suspensiones
  late int numSuspensiones;

  // Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
  // por defecto los componentes de la bicicleta, además de inicializar los propios a valores por defecto
  BicicletaMontana(
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
        required int numSuspensiones}) :
        super(tipoManillar, tipoFrenos, numFrenos, tipoTransmision, tipoCuadro,
          tipoSillin, tipoRuedas, numRuedas, imagenRepresentativa, tipoBicicleta) {
    tipoSuspension = tipoSuspension;
    numSuspensiones = numSuspensiones;
    //tipoBicicleta= "montana";
  }

  // Getters:
  /*String get tipoSuspension => _tipoSuspension; // Getters:
  int get numSuspensiones => _numSuspensiones;*/

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

  factory BicicletaMontana.fromJson(Map<String, dynamic> json) {
    return BicicletaMontana(
      tipoManillar: json['tipo_manillar'],
      tipoFrenos: json['tipo_frenos'],
      numFrenos: json['num_frenos'],
      tipoTransmision: json['tipo_transmision'],
      tipoCuadro: json['tipo_cuadro'],
      tipoSillin: json['tipo_sillin'],
      tipoRuedas: json['tipo_ruedas'],
      numRuedas: json['num_ruedas'],
      imagenRepresentativa: json['imagen_representativa'],
      tipoBicicleta: json['tipo_bicicleta'],
      tipoSuspension: json['tipo_suspension'],
      numSuspensiones: json['num_suspensiones'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json['tipo_suspension'] = tipoSuspension as String;
    json['num_suspensiones'] = numSuspensiones as int;
    return json;
  }
}
