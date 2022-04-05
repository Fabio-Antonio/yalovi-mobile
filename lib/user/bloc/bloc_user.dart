import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/user/repository/analytics_repository.dart';
import 'package:platzi_trips_app/user/model/analytics.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:location_permissions/location_permissions.dart';
import 'package:geocoding/geocoding.dart';

class userBloc with ChangeNotifier implements Bloc {
  final _auth_repository = authRepository();

  final _analyticsRepository = analyticsRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<UserCredential> signInWithGoogle() {
    return _auth_repository.signInFirebase();
  }

  Future<List<Analytics>> getAnalytics() async {
    return await _analyticsRepository.getAnalytics();
  }

  Future<PermissionStatus> permission() async {
    return await LocationPermissions().requestPermissions();
  }

  signOut() {
    _auth_repository.singOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
