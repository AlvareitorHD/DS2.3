// Clase abstracta que representa una bicicleta de manera general
abstract class Bicicleta {
  // Tipo de manillar
  late String _tipoManillar;

  // Tipo de frenos
  late String _tipoFrenos;

  // Número de frenos
  late int _numFrenos;

  // Tipo de transmisión
  late String _tipoTransmision;

  // Tipo de cuadro
  late String _tipoCuadro;

  // Tipo de sillín
  late String _tipoSillin;

  // Tipo de ruedas
  late String _tipoRuedas;

  // Número de ruedas
  late int _numRuedas;

  /// Imagen representativa de la bicicleta, la cual representará su aspecto
  late String imagenRepresentativa;

  /// Tipo de Bicicleta
  late String _tipoBicicleta;

  // Constructor de la clase sin parámetros. Inicializa a valores por defecto los componentes de la bicicleta
  Bicicleta() {
    _tipoManillar = "";
    _tipoFrenos = "";
    _numFrenos = 0;
    _tipoTransmision = "";
    _tipoCuadro = "";
    _tipoSillin = "";
    _tipoRuedas = "";
    _numRuedas = 0;
    imagenRepresentativa = "";
    _tipoBicicleta = "";
  }

  // Getters para tipoBicicleta
  String get tipoBicicleta => _tipoBicicleta;
  String get tipoFrenos => _tipoFrenos;
  int get numFrenos => _numFrenos;
  String get tipoTransmision => _tipoTransmision;
  String get tipoCuadro => _tipoCuadro;
  String get tipoSillin => _tipoSillin;
  String get tipoRuedas => _tipoRuedas;
  int get numRuedas => _numRuedas;


  String get tipoManillar => _tipoManillar; // Setter para tipoBicicleta
  set tipoBicicleta(String tipo) {
    _tipoBicicleta = tipo;
  }

  /// Asocia una imagen con la representación interna de la bicicleta
  void asociarImagen(String imagen) {
    imagenRepresentativa = imagen;
  }

  // Modificador del manillar
  void establecerManillar(String tipo) {
    _tipoManillar = tipo;
  }

  // Modificador de los frenos
  void establecerFrenos(String tipo, int num) {
    _tipoFrenos = tipo;
    _numFrenos = num;
  }

  // Modificador de la transmisión
  void establecerTransmision(String tipo) {
    _tipoTransmision = tipo;
  }

  // Modificador del cuadro
  void establecerCuadro(String tipo) {
    _tipoCuadro = tipo;
  }

  // Modificador del sillín
  void establecerSillin(String tipo) {
    _tipoSillin = tipo;
  }

  // Modificador de las ruedas
  void establecerRuedas(String tipo, int num) {
    _tipoRuedas = tipo;
    _numRuedas = num;
  }

  // Método abstracto para que la bicicleta avance (cada tipo de bicicleta avanzará a su manera)
  void avanzar();

  // Sobreescritura del método 'toString' para representar la información de la bicicleta
  @override
  String toString() {
    return ("\nBicicleta:\n\n\tTipo de manillar: "
        "$_tipoManillar\n\tTipo de frenos: $_tipoFrenos\n\tNúmero de frenos: $_numFrenos\n\t"
        "Tipo de transmisión: $_tipoTransmision\n\tTipo de cuadro: $_tipoCuadro\n\t"
        "Tipo de sillín: $_tipoSillin\n\tTipo de ruedas: $_tipoRuedas\n\tNúmero de Ruedas: $_numRuedas\n"
        "\tImagen representativa: $imagenRepresentativa\n");
  }
}
