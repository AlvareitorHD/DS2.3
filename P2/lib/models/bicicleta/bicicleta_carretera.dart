import 'bicicleta.dart';

// Clase hija de Bicicleta. Esta representa a una bicicleta de carretera
class BicicletaCarretera extends Bicicleta {
  // Constructor de la clase sin parámetros. Llama al constructor de la superclase para que esta inicialice a valores
  // por defecto los componentes de la bicicleta
  /*BicicletaCarretera() {
    tipoBicicleta= "carretera";
  }*/

  BicicletaCarretera(
      {required String tipoManillar,
        required String tipoFrenos,
        required int numFrenos,
        required String tipoTransmision,
        required String tipoCuadro,
        required String tipoSillin,
        required String tipoRuedas,
        required int numRuedas,
        required String imagenRepresentativa,
        required String tipoBicicleta}) :
        super(tipoManillar, tipoFrenos, numFrenos, tipoTransmision, tipoCuadro,
          tipoSillin, tipoRuedas, numRuedas, imagenRepresentativa, tipoBicicleta) {
  }

  factory BicicletaCarretera.fromJson(Map<String, dynamic> json) {
    return BicicletaCarretera(
      tipoManillar: json['tipo_manillar'],
      tipoFrenos: json['tipo_frenos'],
      numFrenos: json['num_frenos'],
      tipoTransmision: json['tipo_transmision'],
      tipoCuadro: json['tipo_cuadro'],
      tipoSillin: json['tipo_sillin'],
      tipoRuedas: json['tipo_ruedas'],
      numRuedas: json['num_ruedas'],
      imagenRepresentativa: json['imagen_representativa'],
      tipoBicicleta: json['tipo_bicicleta']
    );
  }

  // Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta de carretera está
  // avanzando
  @override
  void avanzar() {
    print("\nLa bicicleta de carretera está avanzando...");
  }

  // Sobreescritura del método 'toString' para representar la información de la bicicleta. Llama al de la superclase
  // para contar con la información general de la bicicleta y, además, le añade información específica de este tipo
  // de bicicleta
  @override
  String toString() {
    return (super.toString() +
        "\tTIPO DE BICICLETA: carretera" + "\n");
  }
}
