import 'dart:convert';

class PayInfoDto {
  final String? totalLabel;
  final String? totalLabelValue;
  final double? total;
  final double? shippingValue;
  final String? shippingLabelValue;
  final bool? shippingFree;
  final String? shippingLabel;
  final String? orderId;

  PayInfoDto(
      {this.totalLabel,
      this.shippingFree,
      this.shippingLabel,
      this.orderId,
      this.total,
      this.shippingLabelValue,
      this.shippingValue,
      this.totalLabelValue});

  String toJson() {
    final map = <String, dynamic>{};
    map['totalLabel'] = totalLabel;
    map['shippingFree'] = shippingFree;
    map['shippingLabel'] = shippingLabel;
    map['orderId'] = orderId;

    return jsonEncode(map);
  }
}
