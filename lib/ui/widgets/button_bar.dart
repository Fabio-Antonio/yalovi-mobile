import 'package:flutter/material.dart';
import 'circle_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../bloc/bloc_user.dart';

class ButtonsBar extends StatelessWidget {
  final UserBloc = userBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.turned_in_not, 20.0,
                Color.fromRGBO(255, 255, 255, 1), () => {}),
            CircleButton(false, Icons.add, 40.0,
                Color.fromRGBO(255, 255, 255, 1), () => {}),
            CircleButton(true, Icons.exit_to_app, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {UserBloc.signOut()})
          ],
        ));
  }
}
