import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/productos/ui/widgets/lista_productos.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';

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
