import 'package:platzi_trips_app/productos/model/marca.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class marcasApi {
  final String apiUrl = "http://192.168.1.50:3000/api/marca";

  List<Marca> parseMarcas(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["marca"].cast<Map<String, dynamic>>();
    return parsed.map<Marca>((json) => Marca.fromJson(json)).toList();
  }

  Future<List<Marca>> getMarcas() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseMarcas(result.body);
  }
}
