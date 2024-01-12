import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

abstract class HomeRepository {
  Future<DrawerResponse> getDrawerInfo();
  Future<HomeDto> getHomeInfo();
}
