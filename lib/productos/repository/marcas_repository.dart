import 'package:platzi_trips_app/productos/repository/marcas_api.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';

class marcasRepository {
  final _marcasApi = marcasApi();

  Future<List<Marca>> getMarcas() async {
    return await _marcasApi.getMarcas();
  }
}
