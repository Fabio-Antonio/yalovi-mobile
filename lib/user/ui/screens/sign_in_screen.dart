import 'package:flutter/material.dart';
import 'package:platzi_trips_app/user/ui/model/user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:platzi_trips_app/platzi_trips.dart';

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
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);

    UserBloc.permission().then((PermissionStatus status) => print(status));

    // TODO: implement build
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: UserBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot de aca contiene la data, el objeto user. Abajo se hace algo si no hay data de inicio de sesion
          if (!snapshot.hasData ||
              snapshot.hasError ||
              PermissionStatus.denied == true) {
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
                  UserBloc.signInWithGoogle().then((UserCredential usuario) =>
                      _user = new user(
                          name: usuario.user!.displayName!,
                          email: usuario.user!.email!,
                          photoURL: usuario.user!.photoURL!,
                          phoneNumber: usuario.user!.phoneNumber!));
                },
                tittle: "Ingresar con Google",
              )
            ],
          )
        ],
      ),
    );
  }
}
