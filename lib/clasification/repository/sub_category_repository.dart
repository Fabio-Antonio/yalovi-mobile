import 'package:platzi_trips_app/clasification/model/sub_category.dart';
import 'package:platzi_trips_app/clasification/repository/sub_category_api.dart';

class subCategoryRepository {
  final _subCatApi = subCategoryApi();

  Future<List<Sub_category>> getSubCat(String _idCategory) async {
    return await _subCatApi.getSubCat(_idCategory);
  }

  Future<String> createSubCategory(Sub_category _sub_category) async {
    return await _subCatApi.createSubCategory(_sub_category);
  }
}
