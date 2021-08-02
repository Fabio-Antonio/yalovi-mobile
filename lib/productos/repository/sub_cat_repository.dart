import 'package:platzi_trips_app/productos/repository/sub_cat_api.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';

class subCatRepository {
  final _subCatApi = subCatApi();

  Future<List<Sub_categoria>> getSubCat() async {
    return await _subCatApi.getSubCat();
  }
}
