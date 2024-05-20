import 'decorador_bicicleta.dart';
import '../nombres_imagenes_bicicletas.dart';

/// Clase que hereda de DecoradorBicicleta, la cual representa
/// el decorador que añade una funda a una bicicleta
class DecoradorBicicletaConFunda extends DecoradorBicicleta {
  /// Constructor de la clase. Llama al constructor de la superclase para establecer la bicicleta sobre la que trabajar
  /// y, además, le añade el extra decorativo; en este caso particular, una funda
  ///
  /// @param bicicletaADecorar Bicicleta de base sobre la que aplicar las decoraciones
  ///
  DecoradorBicicletaConFunda(super.bicicletaDecorada) {
    extra = "FUNDA";
  }

  /// Implementación del método abstracto 'avanzar'. Imprime la forma en la que la bicicleta del
  /// tipo que sea con funda está avanzando
  @override
  void avanzar() => print("\nLa bicicleta con funda está avanzando...");

  /// Método que devuelve la información de la bicicleta en formato JSON
  @override
  Map<String, dynamic> toJson() {
    final json = bicicletaDecorada.toJson();
    json['decoracion'] = "FUNDA";
    if (bicicletaDecorada.tipoBicicleta == "montana") {
      json['imagen_representativa'] = BICI_MON_FUN;
    } else if (bicicletaDecorada.tipoBicicleta == "carretera") {
      json['imagen_representativa'] = BICI_CAR_FUN;
    }
    return json;
  }
}
