import 'package:platzi_trips_app/features/catalogue/framework/model/category.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/input.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';

class CatalogueResponseDto {
  final InputDto? input;
  final List<Product>? products;
  final List<CategoryDto>? categories;

  CatalogueResponseDto({
    this.input,
    this.categories,
    this.products,
  });
}
