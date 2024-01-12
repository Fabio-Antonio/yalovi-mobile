import 'package:platzi_trips_app/features/checkout/data/datasource/pay_service.dart';
import 'package:platzi_trips_app/features/checkout/data/repository/pay_repository.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';

class PayRepositoryImpl implements PayRepository {
  final PayService _service;
  const PayRepositoryImpl(this._service);

  @override
  Future<PayResponseDto> getPayInfo() async {
    return await _service.getPayInfo();
  }
}
