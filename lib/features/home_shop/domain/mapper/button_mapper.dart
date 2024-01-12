import 'package:platzi_trips_app/features/home_shop/framework/model/button_dto.dart';

class ButtonMapper {
  static List<ButtonDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();
  static ButtonDto fromJson(Map<String, dynamic> json) {
    return ButtonDto(
      text: json['text'].toString() ?? "",
      screen: json['screen'].toString() ?? "",
      color: json['color'].toString() ?? "",
      height: json['height'] as double??0,
      width: json['width'] as double??0,
    );
  }
}
