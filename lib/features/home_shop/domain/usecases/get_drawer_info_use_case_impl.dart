import 'package:platzi_trips_app/features/home_shop/data/repository/home_repository.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_drawer_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';

class GetDrawerInfoUseCaseImpl implements GetDrawerInfoUseCase {
  final HomeRepository _repository;

  const GetDrawerInfoUseCaseImpl(this._repository,);

  @override
  Future<DrawerResponse> invoke() async {
    final response = await _repository.getDrawerInfo();
    return response;
  }
}