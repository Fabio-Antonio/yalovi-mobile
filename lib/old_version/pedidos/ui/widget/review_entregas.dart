import 'package:flutter/material.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import 'package:platzi_trips_app/pedidos/ui/screen/home.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class reviewEntregas extends StatelessWidget {
  late Ventas ventas;

  reviewEntregas({Key? key, required this.ventas});
  @override
  Widget build(BuildContext context) {
    final nombre = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.nombre,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final apellidos = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.apellidos,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final direccion = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 250.0,
        child: Text(
          ventas.direccion,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.left,
          style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
        ),
      ),
    );

    final referencias = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.referencias,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final telefono = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.telefono,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final pais = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.pais,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final estado = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.estado,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final postal = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.postal,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final token = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Código: " + ventas.token,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final fecha = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.fecha,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final status = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Estatús: " + ventas.status,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final botones = Container(
        margin: EdgeInsets.only(left: 70.0),
        child: Row(
          children: <Widget>[
            buttonGreen(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                address: ventas.direccion,
                                token: ventas.token,
                              )));
                },
                tittle: "Ver mapa"),
          ],
        ));

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        token,
        nombre,
        apellidos,
        telefono,
        direccion,
        referencias,
        pais,
        estado,
        postal,
        status,
        fecha,
        botones
      ],
    );

    return Row(
      children: <Widget>[userDetails],
    );
  }
}
