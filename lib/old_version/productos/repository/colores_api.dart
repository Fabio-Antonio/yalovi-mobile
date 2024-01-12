import 'package:platzi_trips_app/old_version/contants.dart';
import 'package:platzi_trips_app/productos/model/selections.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/productos/model/color_c.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class coloresApi {
  final String apiUrl = Constants().url_qa + "/selections";
  final _securitySingleton = securitySingleton.instance;

  List<Colores> parseColores(String responseBody) {
    List<dynamic> parsed = jsonDecode(responseBody)["selections"][0]["colors"];
    late List<dynamic> colores = <dynamic>[];

    for (int i = 0; i < parsed.length; i++) {
      colores.add(parsed[i][0]);
    }
    final result = colores.cast<Map<String, dynamic>>();
    return result.map<Colores>((json) => Colores.fromJson(json)).toList();
  }

  Future<List<Colores>> getColores() async {
    var result = await http.get(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-token': _securitySingleton!.tokenAccess
    });
    return parseColores(result.body);
  }

  Future<String> createColores(Colores_c _color_c) async {
    final response = await http.post(
      Uri.parse(Constants().url_qa + '/color_c'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-token': _securitySingleton!.tokenAccess
      },
      body: jsonEncode(<String, String>{
        'uid': _color_c.id,
        'name': _color_c.name,
        'code': _color_c.code
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
