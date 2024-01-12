import 'package:firebase_auth/firebase_auth.dart';

abstract class SessionRepository {
  Future<UserCredential?> signInWithGoogle();
  signOut();
  Stream<User?> getSesionStatus();
}