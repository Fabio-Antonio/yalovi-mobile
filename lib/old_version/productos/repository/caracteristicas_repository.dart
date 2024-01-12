import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/productos/repository/caracteristicas_api.dart';
import 'package:platzi_trips_app/productos/model/caracteristicas.dart';

class caracteristicasRepository {
  final _caracteristicasApi = caracteristicaApi();

  Future<String> createCaracteristica(Caracteristica _caracteristica) async {
    return await _caracteristicasApi.createCaracteristica(_caracteristica);
  }
}
