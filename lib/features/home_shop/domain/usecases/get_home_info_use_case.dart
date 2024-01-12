import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

abstract class GetHomeInfoUseCase {
  Future<HomeDto> invoke();
}