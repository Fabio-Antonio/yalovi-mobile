import 'package:platzi_trips_app/features/history_shop/domain/mapper/tab_mapper.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/title_mapper.dart';

class HistoryMapper {
  static List<HistoryDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();
  static HistoryDto fromJson(Map<String, dynamic> json) {
    return HistoryDto(
      title: TitleMapper.fromJson(json['title']),
      tabsLength: json['tabsLength'] as int ?? 0,
      tabs: TabMapper.fromJsonList(json['tabs']),
    );
  }
}
