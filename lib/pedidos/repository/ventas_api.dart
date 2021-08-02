import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ventasApi {
  final String apiUrl = "http://192.168.1.50:3000/api/ventas";

  List<Ventas> parseVentas(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["ventas"].cast<Map<String, dynamic>>();
    return parsed.map<Ventas>((json) => Ventas.fromJson(json)).toList();
  }

  Future<List<Ventas>> getVentasApi(String _status) async {
    var result = await http.get(Uri.parse(apiUrl + "/" + _status));
    return parseVentas(result.body);
  }

  Future<String> updateVenta(String _token, String _status) async {
    final response = await http.put(
      Uri.parse(apiUrl + "/" + _token + "/" + _status),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body)["msg"];
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body)["msg"];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
