import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';

abstract class GetPayInfoUseCase {
  Future<PayResponseDto> invoke();
}