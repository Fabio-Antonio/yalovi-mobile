import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/di/session_di.dart';
import 'package:platzi_trips_app/features/login/di/domain.module.dart';
import 'package:platzi_trips_app/features/login/framework/presentation/viewmodel/login_viewmodel.dart';

final loginViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<LoginViewModel, UserCredential?>(
  (ref) {
    return LoginViewModel(ref.watch(signInUseCaseProvider), ref.watch(getVerificationUseCaseProvider),
        ref.watch(sessionStatusUseCaseProvider), ref.watch(signOutUseCaseProvider));
  },
);
