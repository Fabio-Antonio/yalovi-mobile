import 'package:flutter/material.dart';
import 'package:platzi_trips_app/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/productos/ui/widgets/lista_productos.dart';
import 'package:platzi_trips_app/ui/widgets/profile_background.dart';

class searchTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[listaProductos()],
        ),
        ProfileBackground(),
        ProfileHeader(),
      ],
    );
  }
}
