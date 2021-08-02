import 'package:platzi_trips_app/pedidos/repository/pedidos_api.dart';
import 'package:platzi_trips_app/pedidos/model/pedidos.dart';

class pedidosRepository {
  final _pedidosApi = pedidosApi();

  Future<List<Pedidos>> getPedidos(String _token) async {
    return await _pedidosApi.getPedidos(_token);
  }
}
