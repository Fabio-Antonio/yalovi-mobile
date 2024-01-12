import 'package:platzi_trips_app/features/checkout/framework/model/payment_methods_dto.dart';

import 'method_mapper.dart';

class PayMethodsMapper {
  static List<PaymentMethodsDto> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static PaymentMethodsDto fromJson(Map<String, dynamic> json) {
    return PaymentMethodsDto(
        totalLabel: json['totalLabel'].toString() ?? "",
        totalLabelValue: json['totalLabelValue'].toString() ?? "",
        totalValue: json['totalValue'] as double ?? 0,
        title: json['title'].toString() ?? "",
        methods: MethodMapper.fromJsonList(json['methods'] ?? []));
  }
}
