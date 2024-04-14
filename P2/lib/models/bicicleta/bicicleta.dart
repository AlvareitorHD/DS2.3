// Clase abstracta que representa una bicicleta de manera general
abstract class Bicicleta {
  // Tipo de manillar
  late String tipoManillar;

  // Tipo de frenos
  late String tipoFrenos;

  // Número de frenos
  late int numFrenos;

  // Tipo de transmisión
  late String tipoTransmision;

  // Tipo de cuadro
  late String tipoCuadro;

  // Tipo de sillín
  late String tipoSillin;

  // Tipo de ruedas
  late String tipoRuedas;

  // Número de ruedas
  late int numRuedas;

  /// Imagen representativa de la bicicleta, la cual representará su aspecto
  String? _imagenRepresentativa;

  // Constructor de la clase sin parámetros. Inicializa a valores por defecto los componentes de la bicicleta
  Bicicleta() {
    tipoManillar = "";
    tipoFrenos = "";
    numFrenos = 0;
    tipoTransmision = "";
    tipoCuadro = "";
    tipoSillin = "";
    tipoRuedas = "";
    numRuedas = 0;
    _imagenRepresentativa = "";
  }

  /// Consultor de la imagen representativa
  String? get imagenRepresentativa => _imagenRepresentativa;

  /// Asocia una imagen con la representación interna de la bicicleta
  void asociarImagen(String? imagen) {
    _imagenRepresentativa = imagen;
  }

  // Modificador del manillar
  void establecerManillar(String tipo) {
    tipoManillar = tipo;
  }

  // Modificador de los frenos
  void establecerFrenos(String tipo, int num) {
    tipoFrenos = tipo;
    numFrenos = num;
  }

  // Modificador de la transmisión
  void establecerTransmision(String tipo) {
    tipoTransmision = tipo;
  }

  // Modificador del cuadro
  void establecerCuadro(String tipo) {
    tipoCuadro = tipo;
  }

  // Modificador del sillín
  void establecerSillin(String tipo) {
    tipoSillin = tipo;
  }

  // Modificador de las ruedas
  void establecerRuedas(String tipo, int num) {
    tipoRuedas = tipo;
    numRuedas = num;
  }

  // Método abstracto para que la bicicleta avance (cada tipo de bicicleta avanzará a su manera)
  void avanzar();

  // Sobreescritura del método 'toString' para representar la información de la bicicleta
  @override
  String toString() {
    return ("\nBicicleta:\n\n" +
        "\tTipo de manillar: $tipoManillar\n" +
        "\tTipo de frenos: $tipoFrenos\n" +
        "\tNúmero de frenos: $numFrenos\n" +
        "\tTipo de transmisión: $tipoTransmision\n" +
        "\tTipo de cuadro: $tipoCuadro\n" +
        "\tTipo de sillín: $tipoSillin\n" +
        "\tTipo de ruedas: $tipoRuedas\n" +
        "\tNúmero de Ruedas: $numRuedas\n");
  }
}
