import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/enviroment.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';

class subCatApi {
  final String apiUrl = Enviroment().url_qa + "/clasificacion";

  List<Sub_categoria> parseSubCat(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["clasificacion"].cast<Map<String, dynamic>>();

    return parsed
        .map<Sub_categoria>((json) => Sub_categoria.fromJson(json))
        .toList();
  }

  Future<List<Sub_categoria>> getSubCat() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseSubCat(result.body);
  }
}
