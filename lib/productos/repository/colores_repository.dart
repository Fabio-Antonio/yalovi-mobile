import 'package:platzi_trips_app/productos/repository/colores_api.dart';
import 'package:platzi_trips_app/productos/model/selections.dart';
import 'package:platzi_trips_app/productos/model/color_c.dart';

class coloresRepository {
  final _coloresApi = coloresApi();

  Future<List<Colores>> getColores() async {
    return await _coloresApi.getColores();
  }

  Future<String> createColores(Colores_c _color_c) async {
    return await _coloresApi.createColores(_color_c);
  }
}
