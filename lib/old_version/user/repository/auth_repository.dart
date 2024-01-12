import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'Firebase_Auth_api.dart';

class authRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<user> signInFirebase() => _firebaseAuthAPI.signInWithGoogle();

  Future<String> generateToken(user _user) async {
    return await _firebaseAuthAPI.generateToken(_user);
  }

  singOut() => _firebaseAuthAPI.singnOut();
}
