import 'package:platzi_trips_app/features/catalogue/framework/model/input.dart';

class InputMapper {
  static List<InputDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static InputDto fromJson(Map<String, dynamic> json) {
    return InputDto(
      fontSize: json["fontSize"] as double,
      textHint: json["textHint"].toString() ?? "",
      padding: json["padding"] as double,
    );
  }
}