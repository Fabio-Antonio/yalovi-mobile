import 'dart:convert';

import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_item.dart';

class DrawerResponse {
  final List<DrawerItem>? options;

  DrawerResponse({this.options});

  String toJson() {
    final map = <String, dynamic>{};
    map['options'] = options;
    return jsonEncode(map);
  }
}
