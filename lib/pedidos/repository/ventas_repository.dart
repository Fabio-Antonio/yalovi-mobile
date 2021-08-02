import 'package:platzi_trips_app/pedidos/repository/ventas_api.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';

class ventasRepository {
  final _ventasApi = ventasApi();
  Future<List<Ventas>> getVentas(String _status) async {
    return await _ventasApi.getVentasApi(_status);
  }

  Future<String> updateVentas(String _token, String _status) async {
    return await _ventasApi.updateVenta(_token, _status);
  }
}
