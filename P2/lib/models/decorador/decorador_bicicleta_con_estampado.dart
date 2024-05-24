import 'decorador_bicicleta.dart';
import '../nombres_imagenes_bicicletas.dart';

/// Clase que hereda de DecoradorBicicleta, la cual representa el
/// decorador que añade un estampado a una bicicleta
class DecoradorBicicletaConEstampado extends DecoradorBicicleta {
  /// Constructor de la clase. Llama al constructor de la superclase para establecer
  /// la bicicleta sobre la que trabajar y, además, le añade el extra decorativo;
  /// en este caso particular, un estampado param bicicletaADecorar Bicicleta de base
  /// sobre la que aplicar las decoraciones
  DecoradorBicicletaConEstampado(super.bicicletaDecorada) {
    extra = "ESTAMPADO";
  }

  /// Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta del tipo que sea con
  /// estampado está avanzando
  @override
  void avanzar() => print("\nLa bicicleta con estampado está avanzando...");

  /// Método que devuelve la información de la bicicleta en formato JSON
  @override
  Map<String, dynamic> toJson() {
    final json = bicicletaDecorada.toJson();
    json['decoracion'] = "ESTAMPADO";
    if (json['tipo_bicicleta'] == "montana") {
      json['imagen_representativa'] = BICI_MON_EST;
    } else if (json['tipo_bicicleta'] == "carretera") {
      json['imagen_representativa'] = BICI_CAR_EST;
    }
    return json;
  }
}
