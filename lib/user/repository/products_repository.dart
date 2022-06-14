import 'package:platzi_trips_app/user/model/product.dart';
import 'package:platzi_trips_app/user/repository/products_api.dart';

class ProductssRepository {
  final _productsApi = ProductsApi();
  Future<List<Product>> getProducts() async {
    return await _productsApi.getProducts();
  }
}
