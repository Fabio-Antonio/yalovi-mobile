import 'package:platzi_trips_app/features/vip/data/repository/vip_repository.dart';
import 'package:platzi_trips_app/features/vip/data/source/vip_service.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

class VipRepositoryImpl implements VipRepository {
  final VipService _service;
  const VipRepositoryImpl(this._service);

  @override
  Future<VipResponseDto> getVipInfo() async {
    return await _service.getVipInfo();
  }
}
