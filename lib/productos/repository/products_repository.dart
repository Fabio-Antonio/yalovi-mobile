import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/repository/products_api.dart';

class ProductssRepository {
  final _productsApi = ProductsApi();
  Future<List<Producto>> getProducts() async {
    return await _productsApi.getProducts();
  }
}
