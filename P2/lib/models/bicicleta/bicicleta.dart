// Clase abstracta que representa una bicicleta de manera general
import 'package:ejercicio3/models/bicicleta/bicicleta_montana.dart';

import 'bicicleta_carretera.dart';

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
  late String imagenRepresentativa;

  /// Tipo de Bicicleta
  late String tipoBicicleta;


  Bicicleta(
      this.tipoManillar,
      this.tipoFrenos,
      this.numFrenos,
      this.tipoTransmision,
      this.tipoCuadro,
      this.tipoSillin,
      this.tipoRuedas,
      this.numRuedas,
      this.imagenRepresentativa,
      this.tipoBicicleta); // Constructor de la clase sin parámetros. Inicializa a valores por defecto los componentes de la bicicleta
  /*Bicicleta() {
    tipoManillar = "";
    tipoFrenos = "";
    numFrenos = 0;
    tipoTransmision = "";
    tipoCuadro = "";
    tipoSillin = "";
    tipoRuedas = "";
    numRuedas = 0;
    imagenRepresentativa = "";
    tipoBicicleta = "";
  }*/

  // Getters para tipoBicicleta
  /*String get tipoBicicleta => tipoBicicleta;
  String get tipoFrenos => tipoFrenos;
  int get numFrenos => numFrenos;
  String get tipoTransmision => tipoTransmision;
  String get tipoCuadro => tipoCuadro;
  String get tipoSillin => tipoSillin;
  String get tipoRuedas => tipoRuedas;
  int get numRuedas => numRuedas;


  String? get tipoManillar => _tipoManillar;*/ // Setter para tipoBicicleta
  /*set tipoBicicleta(String? tipo) {
    tipoBicicleta = tipo;
  }*/

  /// Asocia una imagen con la representación interna de la bicicleta
  void asociarImagen(String imagen) {
    imagenRepresentativa = imagen;
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
    return ("\nBicicleta:\n\n\tTipo de manillar: "
        "$tipoManillar\n\tTipo de frenos: $tipoFrenos\n\tNúmero de frenos: $numFrenos\n\t"
        "Tipo de transmisión: $tipoTransmision\n\tTipo de cuadro: $tipoCuadro\n\t"
        "Tipo de sillín: $tipoSillin\n\tTipo de ruedas: $tipoRuedas\n\tNúmero de Ruedas: $numRuedas\n"
        "\tImagen representativa: $imagenRepresentativa\n");
  }

  factory Bicicleta.fromJson(Map<String, dynamic> json) {
    switch(json['tipo_bicicleta']) {
      case 'montana':
        return BicicletaMontana.fromJson(json);
      case 'carretera':
        return BicicletaCarretera.fromJson(json);
      default:
        throw Exception('Tipo de bicicleta desconocido');
    }
  }

  // Metodo abstracto para convertir los datos de una bicicleta a JSON
  Map<String, dynamic> toJson() {
    return {
      'tipo_manillar': tipoManillar as String,
      'tipo_frenos': tipoFrenos as String,
      'num_frenos': numFrenos as int,
      'tipo_transmision': tipoTransmision as String,
      'tipo_cuadro': tipoCuadro as String,
      'tipo_sillin': tipoSillin as String,
      'tipo_ruedas': tipoRuedas as String,
      'num_ruedas': numRuedas as int,
      'imagen_representativa': imagenRepresentativa as String,
      'tipo_bicicleta': tipoBicicleta as String
    };
  }

}
