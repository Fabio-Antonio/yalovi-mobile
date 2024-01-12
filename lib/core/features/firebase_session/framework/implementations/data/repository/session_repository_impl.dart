import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/datasource/session_service.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/repository/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository  {
  final SessionService sessionService;
  const SessionRepositoryImpl(this.sessionService);

  @override
  Future<UserCredential?> signInWithGoogle()async {
    return await sessionService.signInWithGoogle();
  }


  @override
  Stream<User?> getSesionStatus(){
    return sessionService.getSesionStatus();
  }

  @override
  signOut() async{
    return await sessionService.signOut();
  }
}