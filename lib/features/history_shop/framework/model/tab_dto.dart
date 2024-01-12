import 'dart:convert';

import 'package:platzi_trips_app/features/history_shop/framework/model/tabs_list_dto.dart';

class TabDto {
  final String? text;
  final String? urlIcon;
  final List<TabListDto>? tabList;

  TabDto({this.text, this.urlIcon, this.tabList});

  String toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['urlIcon'] = urlIcon;
    map['tabList'] = tabList;

    return jsonEncode(map);
  }
}
