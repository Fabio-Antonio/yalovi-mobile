import 'package:platzi_trips_app/features/checkout/framework/model/method_dto.dart';

class PaymentMethodsDto {
  final String? totalLabel;
  final String? totalLabelValue;
  final double? totalValue;
  final String? title;
  final List<MethodDto>? methods;

  PaymentMethodsDto({this.totalLabel, this.totalLabelValue, this.totalValue, this.title, this.methods});
}
