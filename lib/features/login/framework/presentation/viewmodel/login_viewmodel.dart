import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/get_session_status_use_case.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_in_use_case.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_out_use_case.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/login/domain/usecases/get_verification_info_use_case.dart';
import 'package:platzi_trips_app/features/login/framework/model/user.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

class LoginViewModel extends StateNotifier<UserCredential?> {
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;
  final SessionStatusUseCase _statusUseCase;
  final GetVerificationInfoUseCase _getVerificationInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  LoginViewModel(this._signInUseCase, this._getVerificationInfoUseCase, this._statusUseCase, this._signOutUseCase,
      [UserCredential? user])
      : super(user);

  bool _isLogin = false;

  bool get isLogin {
    return _isLogin;
  }

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<String> _showOtpModal = StreamController<String>.broadcast();

  Stream get showOtpModal => _showOtpModal.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<bool> _permissionGranted = StreamController<bool>.broadcast();

  Stream get permissionGranted => _permissionGranted.stream;

  final StreamController<VerificationResponse> _verificationInfo = StreamController<VerificationResponse>.broadcast();

  Stream get getVerificationInfoComponents => _verificationInfo.stream;

  List<Permission> appPermissions = [Permission.location, Permission.storage, Permission.camera];

  Future<bool> permission() async {
    Map<Permission, PermissionStatus> statuses = await appPermissions.request();
    late bool permissionsAccept = true;
    appPermissions.map((permission) {
      if (statuses[permission] == PermissionStatus.denied) {
        permissionsAccept = false;
      }
    }).toList();
    return permissionsAccept;
  }

  void permissionService() async {
    final permissionResult = await permission();
    if (permissionResult) {
      _permissionGranted.add(permissionResult);
      return;
    }
    permissionService();
  }

  getVerificationInfo() async {
    _isLoading.add(true);
    await _getVerificationInfoUseCase.invoke().then((value) {
      _verificationInfo.sink.add(value);
      _isLoading.add(false);
      if ((value?.user?.requirePhoneValidation ?? false) == false) {
        _showOtpModal.add((value?.bottomShetText ?? ''));
      }
    });
  }

  getSessionStatus() {
    return _statusUseCase.invoke();
  }

  signIn() => _signInUseCase.invoke().then((value) {
        _isLogin = true;
      }).onError((error, stackTrace) {
        _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
      });
  signOut() async {
    await _signOutUseCase.invoke().then((value) {}).onError((error, stackTrace) {
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }

  setUserAuth(UserAuth user) {
    _securitySingleton?.user = user;
  }
}
