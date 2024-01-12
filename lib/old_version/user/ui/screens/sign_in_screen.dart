import 'package:flutter/material.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/old_version/platzi_trips.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  final UserBloc = userBloc();
  late user _user;
  final _securitySingleton = securitySingleton.instance;
  late bool permissionGranted = false;

  @override
 void initState() {
    super.initState();
    permissionService();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);

    // TODO: implement build
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: UserBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot de aca contiene la data, el objeto user. Abajo se hace algo si no hay data de inicio de sesion
          if (!snapshot.hasData ||
              snapshot.hasError||
              !permissionGranted) {
            return signInGoogleUI();
          } else {
            return PlatziTrips();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("YA' LO VI", MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bienvenido \n System Managger",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              buttonGreen(
                onPressed: () {
                  UserBloc.signInWithGoogle().then((_user) =>
                      UserBloc.generateToken(_user).then(
                          (value) => _securitySingleton!.tokenAccess = value));
                },
                tittle: "Ingresar con Google",
              )
            ],
          )
        ],
      ),
    );
  }
  void permissionService()  async {
    final permissionResult = await UserBloc.permission();
    if(permissionResult) {
      permissionGranted=true;
      return;
    }
    permissionService();
  }
}
