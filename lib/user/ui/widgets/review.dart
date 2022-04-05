import 'package:flutter/material.dart';
import 'package:platzi_trips_app/user/model/mensaje.dart';

class Review extends StatelessWidget {
  Mensaje _mensaje;
  Review(@required this._mensaje);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userComment = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 200.0,
        child: Text(
          _mensaje.mensaje,
          textAlign: TextAlign.left,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: TextStyle(
              fontFamily: "Lato", fontSize: 13.0, fontWeight: FontWeight.w900),
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        _mensaje.email,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: SizedBox(
          width: 210.0,
          child: Text(
            _mensaje.nombre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            textAlign: TextAlign.left,
            style: TextStyle(fontFamily: "Lato", fontSize: 14.0),
          )),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[userName, userInfo, userComment],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/img/chat.png"))),
    );

    return Row(
      children: <Widget>[photo, userDetails],
    );
  }
}
