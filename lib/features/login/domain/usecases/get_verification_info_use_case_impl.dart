import 'package:platzi_trips_app/features/login/data/repository/verification_repository.dart';
import 'package:platzi_trips_app/features/login/domain/usecases/get_verification_info_use_case.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

class GetVerificationInfoUseCaseImpl implements GetVerificationInfoUseCase {
  final VerificationRepository _repository;

  const GetVerificationInfoUseCaseImpl(this._repository,);

  @override
  Future<VerificationResponse> invoke() async {
    final response = await _repository.getVerificationInfo();
    return response;
  }
}