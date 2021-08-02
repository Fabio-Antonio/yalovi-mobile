import 'package:platzi_trips_app/productos/model/color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/productos/model/color_c.dart';

class coloresApi {
  final String apiUrl = "http://192.168.1.50:3000/api/color";

  List<Colores> parseColores(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["color"].cast<Map<String, dynamic>>();

    return parsed.map<Colores>((json) => Colores.fromJson(json)).toList();
  }

  Future<List<Colores>> getColores() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseColores(result.body);
  }

  Future<String> createColores(Colores_c _color_c) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.50:3000/api/color_c'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'producto': _color_c.producto,
        'color': _color_c.color
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body)["msg"];
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body)["msg"];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
