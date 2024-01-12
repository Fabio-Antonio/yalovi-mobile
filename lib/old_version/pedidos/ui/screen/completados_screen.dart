import 'package:flutter/material.dart';
import 'package:platzi_trips_app/old_version/contants.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/pedidos/ui/widget/review_ventas_list.dart';

class completadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              reviewVentasList(
                status: "Completado",
              )
            ],
          ),
          ProfileBackground(
            sizeScreen: Constants().simpleBar,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, bottom: 0, right: 30, top: 20),
            child: ProfileHeader(),
          ),
        ],
      ),
    );
  }
}
