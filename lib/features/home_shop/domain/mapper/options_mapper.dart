import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_item.dart';

class DrawerItemMapper {
  static List<DrawerItem> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static DrawerItem fromJson(Map<String, dynamic> json) {
    return DrawerItem(
      title: json["title"].toString() ?? "",
      navigation: json["navigation"].toString() ?? "",
      icon: json["icon"].toString() ?? "",
    );
  }
}
