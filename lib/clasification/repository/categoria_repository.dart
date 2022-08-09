import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/clasification/model/category.dart';

import 'package:platzi_trips_app/clasification/repository/categoria_api.dart';

class categoryRepository {
  final _categoriaApi = categoriaApi();

  Future<String> createCaracteristica(Category _category) async {
    return await _categoriaApi.createCategory(_category);
  }

  Future<List<Category>> getCat() async {
    return await _categoriaApi.getCat();
  }
}
