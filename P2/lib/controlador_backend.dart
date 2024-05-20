import 'package:ejercicio3/models/bicicleta/bicicleta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ControladorBackend {

  final String apiUrl = "http://localhost:3000/bicicletas";

  ControladorBackend();

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

  Future<List<dynamic>> mostarBicicletas() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error cargando bicicletas');
    }
  }

}
