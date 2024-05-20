import 'package:ejercicio3/models/bicicleta/bicicleta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ControladorBackend {

  late List<Bicicleta> listaBicicletas;
  final String apiUrl = "http://localhost:3000/bicicletas";

  ControladorBackend();

  Future<void> cargarBicicletas(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl?tipo_bicicleta=montana'));
    if (response.statusCode == 200) {
      List<dynamic> bicisJson = json.decode(response.body);

      listaBicicletas.addAll(bicisJson.map((json) => Bicicleta.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load bycicles');
    }
  }

  Future<void> crearBicicleta(Bicicleta bicicleta) async {

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(bicicleta.toJson()) // Duda: si es bicicleta montana, hace llamada a BicicletaMontana.toJson() ???
    );

    if (response.statusCode != 201) {
      throw Exception('Fallo al agregar la bici: ${response.body}');
    }

  }

  Future<void> updateBicicleta(int id, Map<String, dynamic> bicicleta) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(bicicleta),
    );
    if (response.statusCode != 200) {
      throw Exception('Error actualizando bicicleta');
    }
  }

  Future<void> deleteBicicleta(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error eliminando bicicleta');
    }
  }

}
