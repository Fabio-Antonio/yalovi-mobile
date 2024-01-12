import 'package:platzi_trips_app/features/home_shop/data/datasource/home_services.dart';
import 'package:platzi_trips_app/features/home_shop/data/repository/home_repository.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _service;
  const HomeRepositoryImpl (this._service);

  @override
  Future<DrawerResponse> getDrawerInfo() async {
    return await _service.getDrawerInfo();
  }

  @override
  Future<HomeDto> getHomeInfo() async {
    return await _service.getHomeInfo();
  }
}