import 'package:flutter/material.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import 'package:platzi_trips_app/pedidos/ui/screen/pedidos_screen.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class reviewVentas extends StatelessWidget {
  late Ventas ventas;

  reviewVentas({Key? key, required this.ventas});
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

    final email = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.email,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final direccion = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 230.0,
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

    final forma_pago = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.forma_pago,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final nombre_tarjeta = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        ventas.nombre_tarjeta,
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

    final total = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Total: " + '\$' + ventas.total.toString(),
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
                          builder: (context) => pedidosScreen(
                                token: ventas.token,
                              )));
                },
                tittle: "Ver pedido"),
          ],
        ));

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        token,
        nombre,
        apellidos,
        email,
        telefono,
        direccion,
        referencias,
        pais,
        estado,
        postal,
        forma_pago,
        nombre_tarjeta,
        total,
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
