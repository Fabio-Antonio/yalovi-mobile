import 'package:flutter/material.dart';
import 'package:platzi_trips_app/ui/model/mensaje.dart';
import 'review.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:platzi_trips_app/ui/model/mensaje.dart';
import 'package:platzi_trips_app/ui/model/mensajes.dart';

class ReviewList extends StatelessWidget {
  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('users-list');

  @override
  Widget build(BuildContext context) {
    _ref = FirebaseDatabase.instance
        .reference()
        .child('users-list')
        .orderByChild('nombre');
    // TODO: implement build
    return StreamBuilder(
      stream: _ref.onValue,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          print("no contiene datos");
          return CircularProgressIndicator();
        } else {
          Map mensajes = snapshot.data.snapshot.value;
          return _buildMensaje(mensajes: mensajes);
        }
      },
    );
  }

  Widget _buildMensaje({required Map mensajes}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var i in mensajes.values.toList())
          Review(Mensaje(
              nombre: i["nombre"].toString(),
              email: i["email"].toString(),
              mensaje: i["mensaje"].toString())),
      ],
    );
  }
}
