import 'package:platzi_trips_app/features/home_shop/framework/model/button_dto.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';

class VipResponseDto {
  final String? productName;
  final String? productBrand;
  final String? productImage;
  final double? productPriceValue;
  final String? productPriceLabel;
  final ButtonDto? button;
  final List<SelectSectionDto>? selectSections;
  final List<String>? productDescriptions;

  VipResponseDto({
    this.productName,
    this.productBrand,
    this.productPriceValue,
    this.productPriceLabel,
    this.button,
    this.selectSections,
    this.productDescriptions,
    this.productImage
  });
}
