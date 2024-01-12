import 'dart:convert';

class TabListDto {
  final String? shopCode;
  final String? date;
  final String? deliveryDate;
  final String? labelText;
  final String? labelBackground;
  final String? total;
  final String? address;

  TabListDto(
      {this.shopCode, this.date, this.deliveryDate, this.labelText, this.labelBackground, this.total, this.address});

  String toJson() {
    final map = <String, dynamic>{};
    map['shopCode'] = shopCode;
    map['date'] = date;
    map['deliveryDate'] = deliveryDate;
    map['labelText'] = labelText;
    map['labelBackground'] = labelBackground;
    map['total'] = total;
    map['address'] = address;

    return jsonEncode(map);
  }
}
