
import 'package:platzi_trips_app/features/login/data/datasource/services/verification_service.dart';
import 'package:platzi_trips_app/features/login/data/repository/verification_repository.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationService verificationService;
  const VerificationRepositoryImpl(this.verificationService);

  @override
  Future<VerificationResponse> getVerificationInfo() async {
    return await verificationService.getVerificationInfo();
  }

}