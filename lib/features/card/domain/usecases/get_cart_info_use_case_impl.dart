import 'package:platzi_trips_app/features/card/data/repository/cart_repository.dart';
import 'package:platzi_trips_app/features/card/domain/usecases/get_cart_info_use_case.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';

class GetCartInfoUseCaseImpl implements GetCartInfoUseCase {
  final CartRepository _repository;

  const GetCartInfoUseCaseImpl(
      this._repository,
      );

  @override
  Future<CartResponseDto> invoke() async {
    final response = await _repository.getCartInfo();
    return response;
  }
}