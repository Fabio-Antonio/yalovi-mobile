import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/repository/session_repository.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_in_use_case.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final SessionRepository _repository;

  const SignInUseCaseImpl(this._repository);

  @override
  Future<UserCredential?> invoke() async {
    return await _repository.signInWithGoogle();
  }
}