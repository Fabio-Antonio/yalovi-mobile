import 'package:platzi_trips_app/features/home_shop/domain/mapper/product_list_mapper.ts.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/section_dto.dart';

class SectionsMapper {
  static List<SectionDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static SectionDto fromJson(Map<String, dynamic> json) {
    return SectionDto(
        title: json['title'].toString() ?? "",
        label: json['label'].toString() ?? "",
        labelAction: json['labelAction'].toString() ?? "",
        cardType: json['cardType'].toString() ?? "",
        height: json['height'] as double??0,
        products: ProductListMapper.fromJsonList(json['products']),
    );
  }
}
