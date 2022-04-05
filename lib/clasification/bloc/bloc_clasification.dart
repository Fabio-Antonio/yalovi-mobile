import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/clasification/repository/categoria_repository.dart';

class clasificationBloc with ChangeNotifier implements Bloc {
  final _categoriaRepository = categoryRepository();
  Future<String> createCategory(Category _category) async {
    return await _categoriaRepository.createCaracteristica(_category);
  }

  Future<List<Category>> getCat() async {
    return await _categoriaRepository.getCat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
