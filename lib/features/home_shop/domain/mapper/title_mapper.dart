import 'package:platzi_trips_app/features/home_shop/framework/model/title_dto.dart';

class TitleMapper {
  static List<TitleDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static TitleDto fromJson(Map<String, dynamic> json) {
    return TitleDto(
      fontSize: json["fontSize"] as double,
      text: json["text"].toString() ?? "",
      padding: json["padding"] as double,
    );
  }
}
