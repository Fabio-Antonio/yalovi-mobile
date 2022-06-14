import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class marcasApi {
  final String apiUrl = Constants().url_qa + "/marca";
  final _securitySingleton = securitySingleton.instance;

  List<Marca> parseMarcas(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["marca"].cast<Map<String, dynamic>>();
    return parsed.map<Marca>((json) => Marca.fromJson(json)).toList();
  }

  Future<List<Marca>> getMarcas() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseMarcas(result.body);
  }

  Future<String> createMarca(Marca _marca) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-token': _securitySingleton!.tokenAccess
      },
      body: jsonEncode(<String, String>{
        'marca': _marca.marca,
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
