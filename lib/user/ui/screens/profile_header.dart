import 'package:flutter/material.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../bloc/bloc_user.dart';
import '../model/user.dart';

class ProfileHeader extends StatelessWidget {
  late user _user;

  final Userbloc = userBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);
    return StreamBuilder(
      stream: Userbloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("El usuario no se ha logueado")
          ],
        ),
      );
    } else {
      _user = user(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          phoneNumber: snapshot.data.phoneNumber);
      final title = Text(
        'Administrador',
        style: TextStyle(
            fontFamily: "Lato",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: <Widget>[UserInfo(_user), ButtonsBar()],
        ),
      );
    }
  }
}
