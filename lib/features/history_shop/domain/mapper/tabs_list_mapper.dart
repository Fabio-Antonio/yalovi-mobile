import 'package:platzi_trips_app/features/history_shop/framework/model/tabs_list_dto.dart';

class TabListMapper {
  static List<TabListDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();
  static TabListDto fromJson(Map<String, dynamic> json) {
    return TabListDto(
      shopCode: json['shopCode'].toString(),
      date: json['date'].toString(),
      deliveryDate: json['deliveryDate'].toString(),
      labelText: json['labelText'].toString(),
      labelBackground: json['labelBackground'].toString(),
      total: json['total'].toString(),
      address: json['address'].toString(),
    );
  }
}
