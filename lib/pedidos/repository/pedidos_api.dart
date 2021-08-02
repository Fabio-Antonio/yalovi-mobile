import 'package:platzi_trips_app/pedidos/model/pedidos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class pedidosApi {
  final String apiUrl = "http://192.168.1.50:3000/api/pedidos";

  List<Pedidos> parsePedidos(String responseBody) {
    final parsed =
        jsonDecode(responseBody)["pedidos"].cast<Map<String, dynamic>>();
    return parsed.map<Pedidos>((json) => Pedidos.fromJson(json)).toList();
  }

  Future<List<Pedidos>> getPedidos(String _token) async {
    var result = await http.get(Uri.parse(apiUrl + "/" + _token));
    return parsePedidos(result.body);
  }
}
