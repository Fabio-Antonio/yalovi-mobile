import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/repository/session_repository.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/get_session_status_use_case.dart';

class SessionStatusUseCaseImpl implements SessionStatusUseCase {
  final SessionRepository _repository;

  const SessionStatusUseCaseImpl(this._repository);

  @override
  Stream<User?> invoke()  {
    return  _repository.getSesionStatus();
  }
}