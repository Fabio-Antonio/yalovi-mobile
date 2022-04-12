import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/clasification/model/sub_category.dart';
import 'package:platzi_trips_app/clasification/repository/categoria_repository.dart';
import 'package:platzi_trips_app/clasification/repository/sub_category_repository.dart';

class clasificationBloc with ChangeNotifier implements Bloc {
  final _categoriaRepository = categoryRepository();
  final _subCategoryRepository = subCategoryRepository();

  Future<String> createCategory(Category _category) async {
    return await _categoriaRepository.createCaracteristica(_category);
  }

  Future<List<Category>> getCat() async {
    return await _categoriaRepository.getCat();
  }

  Future<List<Sub_category>> getSubcat(String _idCategory) async {
    return await _subCategoryRepository.getSubCat(_idCategory);
  }

  Future<String> createSubCategory(Sub_category _sub_category) async {
    return await _subCategoryRepository.createSubCategory(_sub_category);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
