// Importaciones de bibliotecas:
import 'package:flutter/material.dart';
// Importaciones de ficheros propios:
import '../widgets/boton.dart';
import 'package:ejercicio3/widgets/etiqueta_texto.dart';
import '../models/bicicleta/bicicleta.dart';
import '../models/constructor/constructor.dart';
import '../models/constructor/constructor_bicicleta_carretera.dart';
import '../models/constructor/constructor_bicicleta_montana.dart';
import '../models/constructor/constructor_bicicleta_decorada.dart';
import '../models/director/director.dart';

/// Clase que representa la vista de la app. Hereda de 'StatefulWidget', por lo
/// que puede cambiar su estado interno durante la ejecución de la aplicación.
/// Esto significa que puede tener variables internas que se modifican en
/// respuesta a eventos, interacciones del usuario o cambios en los datos
class PantallaFactoriaBicicletas extends StatefulWidget {
  const PantallaFactoriaBicicletas({super.key});

  @override
  State<PantallaFactoriaBicicletas> createState() =>
      _PantallaFactoriaBicicletasEstado(0, [], 'Estampado', 'Carretera', false,
          Director(), null, null, [], []);
}

/// Clase para gestionar el estado de la vista de la app
class _PantallaFactoriaBicicletasEstado
    extends State<PantallaFactoriaBicicletas> {
  // Variables que representan el estado de la aplicación:

  /// Índice de la imagen seleccionada del contenedor 2 (historial de bicicletas
  /// construidas)
  int _indiceImagenContenedor2;

  /// Lista con las imágenes de las bicicletas construidas (historial)
  List<String> _imagenesBicicletasConstruidas;

  /// Tipo de decoración seleccionada
  String? _decoracionSeleccionada;

  /// Tipo de bicicleta seleccionada
  String? _tipoBicicleta;

  /// Bandera para saber si se ha creado una bicicleta en un momento dado
  bool _bicicletaCreada;

  /// Director para orquestar las construcciones de las bicicletas
  Director _director;

  /// Constructor para las construcciones
  Constructor? _constructor;

  /// Bicicleta que se irá manejando para las construcciones
  Bicicleta? _bicicleta;

  List<Bicicleta> listaBicicletas;

  List<String> listaExtras;

  /// Constructor de la clase
  _PantallaFactoriaBicicletasEstado(
      this._indiceImagenContenedor2,
      this._imagenesBicicletasConstruidas,
      this._decoracionSeleccionada,
      this._tipoBicicleta,
      this._bicicletaCreada,
      this._director,
      this._constructor,
      this._bicicleta,
      this.listaBicicletas,
      this.listaExtras);

  /// Crea una bicicleta, actualizando la vista para presentar la bicicleta que
  /// se ha mandado construir
  void _crearBicicleta() {
    setState(() {
      // Construir el tipo de bicicleta que corresponda:
      if (_tipoBicicleta == 'Carretera') {
        _constructor = ConstructorBicicletaCarretera();
        _director.hacerBicicletaCarretera(_constructor);
      } else {
        _constructor = ConstructorBicicletaMontana();
        _director.hacerBicicletaMontana(_constructor);
      }

      // Actualizar variables necesarias:
      _bicicleta = _constructor!.obtenerResultado();
      _bicicletaCreada = true;
      listaBicicletas.add(_bicicleta!);
    });
  }

  /// Añade una decoración a la bicicleta que está actualmente en construcción,
  /// actualizando la vista con el resultado de la aplicación de la decoración
  /// seleccionada
  void _anadirDecoracion() {
    setState(() {
      // Actualizar el tipo de constructor necesario:
      _constructor = ConstructorBicicletaDecorada(_bicicleta!);

      // Mandar a construir la bicicleta correspondiente en función del tipo de
      // decoración que se ha seleccionado:
      if (_decoracionSeleccionada == 'Estampado') {
        _director.hacerBicicletaDecoradaConEstampado(_constructor);
      } else {
        _director.hacerBicicletaDecoradaConFunda(_constructor);
      }

      // Actualizar la bicicleta con la nueva construida:
      _bicicleta = _constructor!.obtenerResultado();
      listaBicicletas.add(_bicicleta!);
    });
  }

  void _eliminarDecoracion() {
    setState(() {
      if (listaBicicletas.isNotEmpty) {
        listaBicicletas.removeLast();
        if (listaBicicletas.isNotEmpty) {
          _bicicleta = listaBicicletas.last;
        } else {
          _bicicleta = null;
        }
      }
    });
  }

  String _obtenerExtras() {
    List<String> lineas = _bicicleta.toString().split('\n');
    List<String> resultado = [];
// Iterar sobre las líneas
    for (String linea in lineas) {
      // Buscar líneas que comiencen con "Extra"
      if (linea.contains('Extra: ')) {
        // Extraer el valor después de "Extra: " y agregarlo a la lista
        String valorExtra = linea.substring('Extra: '.length);
        resultado.add(
            valorExtra.trim()); // Usamos trim() para eliminar espacios extra
      }
    }
    return resultado.join(' - ');
  }

  /// Finaliza la construcción de la bicicleta, añadiendo esta al historial
  void _finalizarBicicleta() {
    // Solo en caso de que se haya construido una bicicleta:
    if (_bicicletaCreada) {
      setState(() {
        // Añadir la bicicleta recién terminada al historial de construcciones:
        _aniadirImagenBicicletaConstruida(_bicicleta!.imagenRepresentativa);
        listaExtras.add(_obtenerExtras());
        //print(listaExtras);

        // Reseteo de valores del estado:
        _tipoBicicleta = 'Carretera';
        _decoracionSeleccionada = 'Estampado';
        _bicicletaCreada = false;
        _bicicleta = null;
        _constructor = null;
        listaBicicletas = [];
      });
    }
  }

  /// Dialogo de confirmación para eliminar una bicicleta del historial de
  /// bicicletas construidas
  void _mostrarDialogoConfirmacionEliminacion(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // El usuario debe tocar un botón para cerrar el diálogo
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación de eliminación'),
          content: const Text(
              '¿Seguro que quiere eliminar la bicicleta construida?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cierra el diálogo sin hacer nada más
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                _eliminarBicicleta(); // Elimina la bicicleta
                Navigator.of(context).pop(); // Primero cierra el dialogo
              },
            ),
          ],
        );
      },
    );
  }

  /// Elimina del historial de bicicletas construidas aquella que se encuentra
  /// en pantalla, actualizando la vista consecuentemente
  void _eliminarBicicleta() {
    setState(() {
      // Solo se elimina del historial si el índice actual del contenedor es
      // válido:
      if (_indiceImagenContenedor2 >= 0 &&
          _indiceImagenContenedor2 < _imagenesBicicletasConstruidas.length) {
        // Eliminar la bicicleta del historial:
        _imagenesBicicletasConstruidas.removeAt(_indiceImagenContenedor2);
        listaBicicletas.removeAt(_indiceImagenContenedor2);

        // Actualizar el índice actual del contenedor tras el borrado anterior
        if (_indiceImagenContenedor2 > 0) {
          _indiceImagenContenedor2--;
        } else {
          _indiceImagenContenedor2 = 0;
        }
      }
    });
  }

  /// Añade una imagen de una bicicleta recién construida al hisotrial de imágenes
  /// construidas
  /// @param imagen Imagen a añadir a la lista
  void _aniadirImagenBicicletaConstruida(String imagen) {
    setState(() {
      _imagenesBicicletasConstruidas.add(imagen);
      _indiceImagenContenedor2 = _imagenesBicicletasConstruidas.length - 1;
    });
  }

  /// Método sobreescrito para construir la representación visual del widget
  /// (se define la interfaz de usuario del widget)
  /// @param context Objeto con información sobre la ubicación del widget en el
  /// árbol de widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Establecer el color de fondo

      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++ Barra superior de la pantalla                                  ++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        title: Text('BikeBuilderPlus'),
      ),

      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++ Cuerpo de la pantalla                                          ++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

      body: SingleChildScrollView(
        child: Column(
          // Alinear los widgets a la izquierda:
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Padding(
                // Añadir margen arriba y a los lados:
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con la etiqueta de la zona de construcción de       ++ //
                    // ++ bicicletas                                               ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Divider(), // Línea divisoria horizontal
                    // Etiqueta del historial de bicicletas construidas:
                    crearEtiquetaTexto("Construcción de bicicletas:", 16,
                        FontWeight.bold, Colors.black),
                    Divider(), // Línea divisoria horizontal

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con los selectores para construir las bicicletas    ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Row(
                      children: [
                        Expanded(
                          child: Tooltip(
                            message: "Seleccionar el tipo de bicicleta",
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                value: _tipoBicicleta,
                                items: ['Carretera', 'Montana']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _tipoBicicleta = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 20), // Separación

                        Flexible(
                          child: crearBoton("", "Crear bicicleta", Colors.black,
                              Colors.white24, Size(140, 50), () {
                            _crearBicicleta();
                          }),
                        ),

                        SizedBox(width: 20), // Separación

                        Expanded(
                          child: Tooltip(
                            message:
                                "Seleccionar la decoración para la bicicleta",
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                value: _decoracionSeleccionada,
                                items:
                                    ['Estampado', 'Funda'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _decoracionSeleccionada = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 20), // Separación

                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: crearBoton(
                                "",
                                "Añadir decoración",
                                Colors.black,
                                Colors.white24,
                                Size(170, 50), () {
                              if (_bicicleta != null) _anadirDecoracion();
                            }),
                          ),
                        ),

                        SizedBox(width: 20), // Separación

                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: crearBoton(
                                "",
                                "Eliminar decoración",
                                Colors.black,
                                Colors.white24,
                                Size(190, 50), () {
                              _eliminarDecoracion();
                            }),
                          ),
                        ),
                      ],
                    ),

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con el contenedor para la bicicleta en construcción ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: /*(_imagenContenedor1 != null)*/
                                  (_bicicleta?.imagenRepresentativa != null)
                                      ? Image.asset(_bicicleta!
                                          .imagenRepresentativa!) /*Image.asset(_imagenContenedor1!)*/
                                      : Container(), // Mostrar imagen seleccionada 1
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                              _bicicleta == null ? '' : _bicicleta.toString()),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Separación

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con el botón para finalizar la bicicleta en         ++ //
                    // ++ construcción                                             ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Añadir margen alrededor del botón
                          child: crearBoton("", "Finalizar bicicleta",
                              Colors.black, Colors.white24, Size(160, 50), () {
                            _finalizarBicicleta();
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Separación
                    Divider(), // Línea divisoria horizontal

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con la etiqueta del historial de bicicletas         ++ //
                    // ++ construidas                                              ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    crearEtiquetaTexto("Historial de bicicletas construidas:",
                        16, FontWeight.bold, Colors.black),
                    Divider(), // Línea divisoria horizontal
                    SizedBox(height: 20), // Separación

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con el contenedor para el historial de bicicletas   ++ //
                    // ++ construidas                                              ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Row(
                      children: [
                        // Contenedor para el historial de bicicletas construidas:
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                child: Center(
                                  child: (_indiceImagenContenedor2 >= 0 &&
                                          _indiceImagenContenedor2 <
                                              _imagenesBicicletasConstruidas
                                                  .length)
                                      ? Image.asset(
                                          _imagenesBicicletasConstruidas[
                                              _indiceImagenContenedor2])
                                      : Container(),
                                ),
                              ),

                              // Flechas de navegación del historial de bicicletas
                              // construidas:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Flecha para moverse hacia atrás en el historial de
                                  // bicicletas construidas:
                                  Tooltip(
                                    message: "Imagen anterior",
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      onPressed: () {
                                        setState(() {
                                          // Lógica para cambiar a la imagen anterior:
                                          if (_indiceImagenContenedor2 > 0) {
                                            _indiceImagenContenedor2--;
                                          } else if (_imagenesBicicletasConstruidas
                                              .isNotEmpty) {
                                            _indiceImagenContenedor2 =
                                                _imagenesBicicletasConstruidas
                                                        .length -
                                                    1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  // Flecha para moverse hacia atrás en el historial de
                                  // bicicletas construidas:
                                  Tooltip(
                                    message: "Imagen siguiente",
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward),
                                      onPressed: () {
                                        setState(() {
                                          // Lógica para cambiar a la imagen siguiente:
                                          if (_imagenesBicicletasConstruidas
                                              .isNotEmpty) {
                                            _indiceImagenContenedor2 =
                                                (_indiceImagenContenedor2 + 1) %
                                                    _imagenesBicicletasConstruidas
                                                        .length;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: listaExtras.isNotEmpty &&
                                    _indiceImagenContenedor2 <
                                        listaExtras.length,
                                child: Text(listaExtras.isNotEmpty
                                    ? listaExtras[_indiceImagenContenedor2]
                                    : ''),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //
                    // ++ Fila con el botón para eliminar la bicicleta actual del  ++ //
                    // ++ historial                                                ++ //
                    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ //

                    Row(
                      children: [
                        crearBoton("", "Eliminar bicicleta", Colors.black,
                            Colors.white24, Size(160, 50), () {
                          if (!_imagenesBicicletasConstruidas.isEmpty) {
                            _mostrarDialogoConfirmacionEliminacion(context);
                          }
                        }),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
