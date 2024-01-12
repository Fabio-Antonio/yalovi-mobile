import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

abstract class VipService {
  Future<VipResponseDto> getVipInfo();
}