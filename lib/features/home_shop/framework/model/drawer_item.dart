import 'dart:convert';

class DrawerItem {
  final String? title;
  final String? navigation;
  final String? icon;

  DrawerItem({this.title, this.navigation, this.icon});

  String toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['navigation'] = navigation;
    map['icon'] = icon;

    return jsonEncode(map);
  }
}
