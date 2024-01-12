import 'package:platzi_trips_app/features/checkout/domain/mapper/banner_mapper.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/method_dto.dart';

class MethodMapper {
  static List<MethodDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static MethodDto fromJson(Map<String, dynamic> json) {
    return MethodDto(
        icon: json['icon'].toString() ?? "", isCash: json['isCash'] as bool, banner: BannerMapper.fromJson(json['banner']));
  }
}
