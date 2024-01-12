import 'package:platzi_trips_app/features/catalogue/framework/model/category.dart';

class CategoryMapper {
  static List<CategoryDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static CategoryDto fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      key: json["key"].toString() ?? "",
      value: json["value"].toString() ?? "",
      background: json["background"].toString() ?? ""
    );
  }
}