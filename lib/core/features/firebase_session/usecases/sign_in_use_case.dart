import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInUseCase {
  Future<UserCredential?> invoke();
}