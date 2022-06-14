import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';
import 'package:platzi_trips_app/user/model/product.dart';

class ProductsApi {
  final String apiUrl = Constants().url_qa + "/analytical";
  final _securitySingleton = securitySingleton.instance;

  List<Product> parseProducts(String responseBody) {
    print(jsonDecode(responseBody)["products"]);
    final parsed =
        jsonDecode(responseBody)["products"].cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getProducts() async {
    /*  var result = await http.get(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-token': _securitySingleton!.tokenAccess
    });
    return parseAnalytics(result.body);*/
    print('entra al servicio');
    final String response = await rootBundle.loadString('assets/products.json');

    return parseProducts(response);
  }
}
