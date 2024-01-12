import 'package:platzi_trips_app/old_version/contants.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class categoriaApi {
  final String apiUrl = Constants().url_qa + '/categorias';
  final _securitySingleton = securitySingleton.instance;

  Future<String> createCategory(Category _category) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-token': _securitySingleton!.tokenAccess
      },
      body: jsonEncode(<String, String>{
        'categoria': _category.categoria,
        'descripcion': _category.descripcion
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

  List<Category> parseCat(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["categorias"].cast<Map<String, dynamic>>();

    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  Future<List<Category>> getCat() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseCat(result.body);
  }
}
