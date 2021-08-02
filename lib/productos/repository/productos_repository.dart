import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/productos/model/imagen.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'productos_api.dart';

class productosRepository {
  final _productosApi = productosApi();

  Future<List<Producto>> getProductos() async {
    return await _productosApi.getProductos();
  }

  Future<String> createProducto(Producto _producto) async {
    return await _productosApi.createProduct(_producto);
  }
}
