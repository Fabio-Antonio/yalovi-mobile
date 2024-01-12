import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';

abstract class GetDrawerInfoUseCase {
  Future<DrawerResponse> invoke();
}