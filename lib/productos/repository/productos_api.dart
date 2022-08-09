import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';

class productosApi {
  final String apiUrl = Constants().url_qa + "/productos";
  final _securitySingleton = securitySingleton.instance;

  List<Producto> parseProductos(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["productos"].cast<Map<String, dynamic>>();

    return parsed.map<Producto>((json) => Producto.fromJson(json)).toList();
  }

  Future<List<Producto>> getProductos() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseProductos(result.body);
  }

  Future<String> createProduct(Producto _producto) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-token': _securitySingleton!.tokenAccess
      },
      body: jsonEncode(<String, dynamic>{
        'sub_categoria': _producto.sub_categoria,
        'nombre_producto': _producto.nombre_producto,
        'precio': _producto.precio,
        'marca': _producto.marca,
        'url_imagen': _producto.url_imagen,
        'segunda_mano': _producto.segunda_mano,
        'descuento': _producto.descuento
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
