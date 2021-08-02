import 'package:flutter/material.dart';
import 'package:platzi_trips_app/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/pedidos/ui/widget/review_ventas_list.dart';

class ventasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              reviewVentasList(
                status: "compra",
              )
            ],
          ),
          ProfileBackground(),
          ProfileHeader(),
        ],
      ),
    );
  }
}
