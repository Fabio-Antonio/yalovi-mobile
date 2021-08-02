import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/productos/repository/imagenes_api.dart';
import 'package:platzi_trips_app/productos/model/imagen.dart';

class imagenesRepository {
  final _imagenesApi = imagenesApi();

  Future<String> createImage(Imagen _imagen) async {
    return await _imagenesApi.createImage(_imagen);
  }
}
