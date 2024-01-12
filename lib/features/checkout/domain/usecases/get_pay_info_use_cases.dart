import 'package:platzi_trips_app/features/checkout/data/repository/pay_repository.dart';
import 'package:platzi_trips_app/features/checkout/domain/usecases/get_pay_info_use_case_impl.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';

class GetPayInfoUseCaseImpl implements GetPayInfoUseCase {
  final PayRepository _repository;

  const GetPayInfoUseCaseImpl(
      this._repository,
      );

  @override
  Future<PayResponseDto> invoke() async {
    final response = await _repository.getPayInfo();
    return response;
  }
}