import 'package:firebase_auth/firebase_auth.dart';

abstract class SessionService {
  Future<UserCredential?> signInWithGoogle();
  signOut();
  Stream<User?> getSesionStatus();

}