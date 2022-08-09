import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/user/repository/analytics_repository.dart';
import 'package:platzi_trips_app/user/model/analytics.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class userBloc with ChangeNotifier implements Bloc {
  final _auth_repository = authRepository();

  final _analyticsRepository = analyticsRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<user> signInWithGoogle() {
    return _auth_repository.signInFirebase();
  }

  Future<List<Analytics>> getAnalytics() async {
    return await _analyticsRepository.getAnalytics();
  }

  Future<bool> permission() async {
    Map<Permission, PermissionStatus> statuses = await Constants().appPermissions.request();
    late bool permissionsAccept= true;
    Constants().appPermissions.map((permission){
      print(statuses[permission]);
      if(statuses[permission]==PermissionStatus.denied){
        permissionsAccept= false;
      }
    }
    ).toList();
    return permissionsAccept;
  }

  Future<String> generateToken(user _user) async {
    return await _auth_repository.generateToken(_user);
  }

  signOut() {
    _auth_repository.singOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
