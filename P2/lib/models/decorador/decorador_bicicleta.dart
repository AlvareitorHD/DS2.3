import '../bicicleta/bicicleta.dart';

/// Clase abstracta que hereda de Bicicleta, la cual representa un decorador de bicicletas.
/// Esta clase es una bicicleta y, además, tiene una bicicleta, lo cual permitirá agregar
/// capas encima de la bicicleta primaria
abstract class DecoradorBicicleta extends Bicicleta {
  /// Instancia de la bicicleta a la que se le aplicarán los diferentes tipos de decoraciones
  Bicicleta _bicicletaDecorada;

  /// Añadido especial a la bicicleta (almacenará la decoración específica)
  String? _extra;

  /// Constructor de la clase. Asigna a la bicicleta implícita la bicicleta recibida por parámetro.
  /// Después, sobre esta bicicleta primaria se aplicarán las diferentes capas decorativas
  ///
  /// @param [bicicletaDecorada] Bicicleta de base sobre la que aplicar las decoraciones
  ///
  DecoradorBicicleta(this._bicicletaDecorada) : super('', '', 0, '', '', '', '', 0, '', '');

  /// Setter del añadido especial para que las clases que extiendan de esta puedan darle valor a este atributo
  set extra(String? valor) {
    _extra = valor;
  }

  // Getter del añadido especial
  String? get extra => _extra;

  // Getter de la bicicleta primaria
  Bicicleta get bicicletaDecorada => _bicicletaDecorada;

  /// Sobreescritura del método 'toString' para representar la información de la bicicleta. Llama al de la superclase
  /// para contar con la información general de la bicicleta y, además, le añade información específica sobre ese
  /// extra decorativo
  ///
  /// @return Cadena con la información completa de la bicicleta
  ///
  @override
  String toString() {
    return "$_bicicletaDecorada\tExtra: ${_extra!}\n";
  }
}
