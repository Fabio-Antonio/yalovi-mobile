import 'package:platzi_trips_app/features/vip/data/repository/vip_repository.dart';
import 'package:platzi_trips_app/features/vip/domain/usecases/get_vip_info_usecase.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

class GetVipInfoUseCaseImpl implements GetVipInfoUseCase {
  final VipRepository _repository;

  const GetVipInfoUseCaseImpl(
    this._repository,
  );

  @override
  Future<VipResponseDto> invoke() async {
    final response = await _repository.getVipInfo();
    return response;
  }
}
