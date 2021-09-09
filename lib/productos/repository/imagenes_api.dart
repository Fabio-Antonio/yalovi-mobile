import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/enviroment.dart';
import 'package:platzi_trips_app/productos/model/imagen.dart';

class imagenesApi {
  Future<String> createImage(Imagen _imagen) async {
    final response = await http.post(
      Uri.parse(Enviroment().url_qa + '/imagenes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'producto': _imagen.producto,
        'url_imagen': _imagen.url_imagen
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body)["msg"];
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body)["msg"];
    } else if (response.statusCode == 422) {
      return jsonDecode(response.body)["msg"];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
