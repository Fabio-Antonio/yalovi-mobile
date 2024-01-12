import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';

class SelectSectionMapper {
  static List<SelectSectionDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();
  static SelectSectionDto fromJson(Map<String, dynamic> json) {
    return SelectSectionDto(
      title: json['title'].toString() ?? "",
      isColor: json['isColor'] ?? false,
      values: List<String>.from(json['values']),
    );
  }
}
