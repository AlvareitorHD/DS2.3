import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_estampado.dart';
import 'package:ejercicio3/models/decorador/decorador_bicicleta_con_funda.dart';
import 'package:ejercicio3/models/nombres_imagenes_bicicletas.dart';

import 'constructor.dart';
import '../bicicleta/bicicleta.dart';

/// Clase que extiende [Constructor] para especializarse en la construcción
/// de bicicletas decoradas.
class ConstructorBicicletaDecorada extends Constructor {
  //Solución al tipo de bicicleta
  String tipoAntes = "";
  /// Crea una instancia de [ConstructorBicicletaDecorada] e inicializa
  /// la bicicleta con el valor proporcionado, que puede ser `null`.
  ConstructorBicicletaDecorada(Bicicleta bicicleta) : super() {
    this.bicicleta = bicicleta;
  }

  /// Agrega un estampado a la bicicleta, seleccionando la imagen apropiada
  /// basada en el tipo de bicicleta (montaña o carretera).
  void agregarEstampado() {
    tipoAntes = bicicleta!.tipoBicicleta;
    bicicleta = DecoradorBicicletaConEstampado(bicicleta);
    bicicleta?.tipoBicicleta = tipoAntes;
  }

  /// Agrega una funda a la bicicleta, seleccionando la imagen apropiada
  /// basada en el tipo de bicicleta (montaña o carretera).
  void agregarFunda() {
    tipoAntes = bicicleta!.tipoBicicleta;
    bicicleta = DecoradorBicicletaConFunda(bicicleta);
    bicicleta?.tipoBicicleta = tipoAntes;
  }

  /// Metodo para asociar la imagen de la bicicleta decorada dando prioridad a la funda sobre
  /// el estampado.
  @override
  void asociarImagenBicicleta() {
    // Verifica primero si la bicicleta es de montaña o carretera.
    bool esMontana = bicicleta?.tipoBicicleta == "montana";
    // verifica si tiene estampado.
    if ((bicicleta is DecoradorBicicletaConEstampado)) {
      bicicleta?.asociarImagen(esMontana ? BICI_MON_EST : BICI_CAR_EST);
    } // Si no tiene funda, verifica si tiene estampado.
    else if ((bicicleta is DecoradorBicicletaConFunda)) {
      bicicleta?.asociarImagen(esMontana ? BICI_MON_FUN : BICI_CAR_FUN);
    }
    // Si no tiene ni funda ni estampado, asigna la imagen por defecto según el tipo de bicicleta.
    else {
      bicicleta?.asociarImagen(esMontana ? BICI_MON : BICI_CAR);
    }
  }

  @override

  /// Reconstruye `bicicleta` asignándole el valor `null`.
  void recomponer() => bicicleta;
}
