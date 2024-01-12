import 'package:platzi_trips_app/features/catalogue/domain/mapper/category_mapper.dart';
import 'package:platzi_trips_app/features/catalogue/domain/mapper/input_mapper.ts.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/product_list_mapper.ts.dart';

class CatalogueResponseMapper {
  static CatalogueResponseDto fromJson(Map<String, dynamic> json) {
    return CatalogueResponseDto(
      input: InputMapper.fromJson(json["input"]),
      categories: CategoryMapper.fromJsonList(json['categories']),
      products: ProductListMapper.fromJsonList(json['products']),
    );
  }
}
