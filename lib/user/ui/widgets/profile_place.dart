import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/photo_card.dart';
import '../model/place.dart';
import 'profile_place_info.dart';
import 'profile_place.dart';

class ProfilePlace extends StatelessWidget {
  String image;
  Place place;

  ProfilePlace(this.image, this.place);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[photoCard(image: image), ProfilePlaceInfo(place)],
    );
  }
}
