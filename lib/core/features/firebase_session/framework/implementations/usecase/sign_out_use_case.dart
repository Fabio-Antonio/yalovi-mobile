import 'package:platzi_trips_app/core/features/firebase_session/data/repository/session_repository.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_out_use_case.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  final SessionRepository _repository;

  const SignOutUseCaseImpl(this._repository);

  @override
   invoke() async {
    return await _repository.signOut();
  }
}