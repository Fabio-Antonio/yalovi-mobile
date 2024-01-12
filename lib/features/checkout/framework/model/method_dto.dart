import 'package:platzi_trips_app/features/checkout/framework/model/banner_dto.dart';

class MethodDto {
  final bool? isCash;
  final String? icon;
  final BannerDto? banner;
  bool? isSelected;

  MethodDto({
    this.isCash,
    this.icon,
    this.banner,
    this.isSelected
  });
}
