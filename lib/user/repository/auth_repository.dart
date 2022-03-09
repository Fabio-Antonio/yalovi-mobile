import 'package:firebase_auth/firebase_auth.dart';
import 'Firebase_Auth_api.dart';

class authRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() =>
      _firebaseAuthAPI.signInWithGoogle();

  singOut() => _firebaseAuthAPI.singnOut();
}
