import 'package:platzi_trips_app/features/home_shop/domain/mapper/button_mapper.dart';
import 'package:platzi_trips_app/features/vip/domain/mapper/select_sections_mapper.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

class VipResponseMapper {
  static VipResponseDto fromJson(Map<String, dynamic> json) {
    return VipResponseDto(
        productName: json['productName'].toString() ?? "",
        productPriceLabel: json['productPriceLabel'].toString() ?? "",
        productBrand: json['productBrand'].toString() ?? "",
        productImage: json['productImage'].toString() ?? "",
        productPriceValue: json['productPriceValue'] as double ?? 0.0,
        button: ButtonMapper.fromJson(json["button"]),
        productDescriptions: List<String>.from(
          json['productDescriptions'],
        ),
        selectSections: SelectSectionMapper.fromJsonList(json['selectSections'] ?? []));
  }
}
