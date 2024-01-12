import 'package:platzi_trips_app/features/card/framework/model/pay_info.dart';

class PayInfoMapper {
  static PayInfoDto fromJson(Map<String, dynamic> json) {
    return PayInfoDto(
      totalLabel: json['totalLabel'].toString() ?? "",
      shippingFree: json['shippingFree'] ?? false,
      shippingLabel: json['shippingLabel'].toString() ?? "",
      orderId: json['orderId'].toString() ?? "",
      total: json['total'] as double ?? 0,
      shippingLabelValue: json['shippingLabelValue'].toString() ?? "",
      shippingValue: json['shippingValue'] as double ?? 0,
      totalLabelValue: json['totalLabelValue'].toString() ?? "",
    );
  }
}
