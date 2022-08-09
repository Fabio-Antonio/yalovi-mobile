import 'package:flutter/material.dart';

class photoCard extends StatelessWidget {
  String image;
  photoCard({Key? key, required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.amber,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
    );
  }
}
