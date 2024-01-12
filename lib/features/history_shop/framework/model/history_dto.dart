import 'dart:convert';

import 'package:platzi_trips_app/features/history_shop/framework/model/tab_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/title_dto.dart';

class HistoryDto {
  TitleDto? title;
  int? tabsLength;
  final List<TabDto>? tabs;

  HistoryDto({this.title, this.tabsLength, this.tabs});

  String toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['tabsLength'] = tabsLength;
    map['tabs'] = tabs;

    return jsonEncode(map);
  }
}
