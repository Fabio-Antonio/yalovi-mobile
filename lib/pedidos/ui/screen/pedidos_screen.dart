import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/pedidos/ui/widget/lista_pedidos.dart';
import 'package:platzi_trips_app/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class pedidosScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String token;
  pedidosScreen({Key? key, required this.token});
  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<userBloc>(context);

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              listaPedidos(token: token),
              buttonGreen(
                  onPressed: () {
                    myProvider
                        .updateVentas(token, "Entrega")
                        .then((value) => _scaffoldKey.currentState!
                                .showSnackBar(SnackBar(
                                  content: Text(value),
                                ))
                                .closed
                                .then((SnackBarClosedReason reason) {
                              Navigator.of(context).pop();
                            }));
                  },
                  tittle: "Comprado")
            ],
          ),
          ProfileBackground(),
          ProfileHeader(),
        ],
      ),
    );
  }
}
