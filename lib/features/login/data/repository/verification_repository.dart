import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

abstract class VerificationRepository  {
  Future<VerificationResponse> getVerificationInfo();

}
