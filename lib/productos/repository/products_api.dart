import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class ProductsApi {
  final String apiUrl = Constants().url_qa + "/carrusel_principal";
  final _securitySingleton = securitySingleton.instance;

  List<Producto> parseProducts(String responseBody) {
    print(jsonDecode(responseBody)["productos1"]);
    final parsed =
        jsonDecode(responseBody)["productos1"].cast<Map<String, dynamic>>();
    return parsed.map<Producto>((json) => Producto.fromJson(json)).toList();
  }

  Future<List<Producto>> getProducts() async {
    var result = await http.get(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-token': _securitySingleton!.tokenAccess
    });
    return parseProducts(result.body);
    //print('entra al servicio');
    //final String response = await rootBundle.loadString('assets/products.json');

    //return parseProducts(response);
  }
}
