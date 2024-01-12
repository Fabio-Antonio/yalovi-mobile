import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/clasification/model/sub_category.dart';
import 'package:platzi_trips_app/old_version/contants.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class subCategoryApi {
  final String apiUrl = Constants().url_qa + "/clasificacion/";
  final _securitySingleton = securitySingleton.instance;

  Future<String> createSubCategory(Sub_category _sub_category) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-token': _securitySingleton!.tokenAccess
      },
      body: jsonEncode(<String, String>{
        'categoria': _sub_category.categoria,
        'sub_categoria': _sub_category.sub_categoria
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

  List<Sub_category> parseSubCat(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["clasificacion"].cast<Map<String, dynamic>>();

    return parsed
        .map<Sub_category>((json) => Sub_category.fromJson(json))
        .toList();
  }

  Future<List<Sub_category>> getSubCat(String idCategory) async {
    var result = await http.get(Uri.parse(apiUrl + idCategory));
    return parseSubCat(result.body);
  }
}
