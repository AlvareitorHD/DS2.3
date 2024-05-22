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
import 'package:ejercicio3/controlador_backend.dart';

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

  /// Lista con las bicicletas que se van construyendo
  List<Bicicleta> listaBicicletas;

  /// Lista con los extras (decoraciones) que se les va añadiendo a las
  /// bicicletas
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

  /// Usuario actual
  String currentUser = "Alvaro";

  /// Lista de usuarios
  List<String> users = ["Alvaro", "Luis", "MiguelB", "Miguel", "Gines"];

  /// Controlador de la base de datos
  final ControladorBackend _controladorBackend = ControladorBackend();

  /// Identificador bicicleta
  int? _id_bicicleta_fabricacion;

  @override
  void initState() {
    super.initState();
    _procesarBicicletasPorUsuario(currentUser);
  }

  /// Crea una bicicleta, actualizando la vista para presentar la bicicleta que
  /// se ha mandado construir
  void _crearBicicleta() async {
    setState(() {
      // Construir el tipo de bicicleta que corresponda:
      if (_tipoBicicleta == 'Carretera') {
        _constructor = ConstructorBicicletaCarretera();
        _director.hacerBicicletaCarretera(_constructor, currentUser);
      } else {
        _constructor = ConstructorBicicletaMontana();
        _director.hacerBicicletaMontana(_constructor, currentUser);
      }

      // Actualizar variables necesarias:
      _bicicleta = _constructor!.obtenerResultado();
      _bicicletaCreada = true;
      listaBicicletas = [];
      listaBicicletas.add(_bicicleta!);
    });

    // Actualizamos base de datos
    int id = await _controladorBackend.crearBicicleta(_bicicleta!);
    _procesarBicicletasPorUsuario(currentUser);

    setState(() {
      _id_bicicleta_fabricacion = id;
    });
  }

  /// Añade una decoración a la bicicleta que está actualmente en construcción,
  /// actualizando la vista con el resultado de la aplicación de la decoración
  /// seleccionada
  void _anadirDecoracion() async {
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
    // Actualizamos base de datos
    await _controladorBackend.updateBicicleta(
        _id_bicicleta_fabricacion!, _bicicleta!.toJson());
    _procesarBicicletasPorUsuario(currentUser);
  }

  void _eliminarBicicleta() async {
    setState(() {
      listaBicicletas = [];
      _bicicleta = null;
    });

    // Actualizamos base de datos
    await _controladorBackend.deleteBicicleta(_id_bicicleta_fabricacion!);
    _procesarBicicletasPorUsuario(currentUser);
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
        //_aniadirImagenBicicletaConstruida(_bicicleta!.imagenRepresentativa);
        //listaExtras.add(_obtenerExtras());
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

  /// Procesa las bicicletas por usuario
  Future<void> _procesarBicicletasPorUsuario(String usuario) async {
    List<List<String>> bicicletas =
        await _controladorBackend.mostarBicicletasPorUsuario(usuario);
    setState(() {
      _imagenesBicicletasConstruidas = [];
      listaExtras = [];
      int _indiceImagenContenedor2 = 0;

      for (var bicicleta in bicicletas) {
        List<String> decoraciones = [];
        String imagenRepresentativa = "";

        for (var elemento in bicicleta) {
          if (elemento == "FIN") {
            break;
          }
          decoraciones.add(elemento);
        }

        if (bicicleta.isNotEmpty) {
          imagenRepresentativa = bicicleta.last;
        }

        listaExtras.add(decoraciones.join(","));
        _imagenesBicicletasConstruidas.add(imagenRepresentativa);
      }
    });

    print(listaExtras);
    print(_imagenesBicicletasConstruidas);
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

  /// Añade una imagen de una bicicleta recién construida al hisotrial de imágenes
  /// construidas
  /// @param imagen Imagen a añadir a la lista
  void _aniadirImagenBicicletaConstruida(String imagen) {
    setState(() {
      _imagenesBicicletasConstruidas.add(imagen);
      _indiceImagenContenedor2 = _imagenesBicicletasConstruidas.length - 1;
    });
  }

  void _onUserChanged(String? newValue) async {
    if (newValue != null && newValue != currentUser) {
      setState(() {
        currentUser = newValue;
      });
      await _procesarBicicletasPorUsuario(currentUser);
    }
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
        actions: <Widget>[
          DropdownButton<String>(
            value: currentUser,
            icon: Icon(Icons.arrow_downward),
            onChanged: _onUserChanged,
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
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
                                "Eliminar Bicicleta",
                                Colors.black,
                                Colors.white24,
                                Size(190, 50), () {
                              _mostrarDialogoConfirmacionEliminacion(context);
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
                          child: crearBoton("", "Siguiente bicicleta",
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
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
