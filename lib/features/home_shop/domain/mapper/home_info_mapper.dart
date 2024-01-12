import 'package:platzi_trips_app/features/home_shop/domain/mapper/button_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/section_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/title_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

class HomeInfoMapper {
  static List<HomeDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static HomeDto fromJson(Map<String, dynamic> json) {
    return HomeDto(
        imgUrl: json['imgUrl'].toString() ?? "",
        title: TitleMapper.fromJson(json["title"]),
        button: ButtonMapper.fromJson(json["button"]),
        sections: SectionsMapper.fromJsonList(json["sections"]));
  }
}
