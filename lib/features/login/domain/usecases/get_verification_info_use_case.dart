
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

abstract class GetVerificationInfoUseCase {
  Future<VerificationResponse> invoke();
}