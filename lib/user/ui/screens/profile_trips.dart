import 'package:flutter/material.dart';
import 'package:platzi_trips_app/contants.dart';
import 'profile_header.dart';
import '../widgets/profile_places_list.dart';
import '../widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(sizeScreen: Constants().simpleBar),
        ListView(
          children: <Widget>[ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );
  }
}
