import 'package:firebase_auth/firebase_auth.dart';

abstract class SessionStatusUseCase {
  Stream<User?> invoke();
}