import 'package:platzi_trips_app/features/history_shop/domain/mapper/tabs_list_mapper.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/tab_dto.dart';

class TabMapper {
  static List<TabDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();
  static TabDto fromJson(Map<String, dynamic> json) {
    return TabDto(
      text: json['text'].toString() ?? "",
      urlIcon: json['urlIcon'].toString() ?? "",
      tabList: TabListMapper.fromJsonList(json['tabList']),
    );
  }
}
