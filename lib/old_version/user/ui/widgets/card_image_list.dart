import 'package:flutter/material.dart';
import 'package:platzi_trips_app/pedidos/ui/screen/completados_screen.dart';
import 'package:platzi_trips_app/pedidos//ui/screen/entregas_screen.dart';
import 'package:platzi_trips_app/pedidos/ui/screen/ventas_screen.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/pedidos.png", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ventasScreen()));
          }),
          CardImage("assets/img/envio.png", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => entregasScreen()));
          }),
          CardImage("assets/img/entregado.png", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => completadosScreen()));
          }),
        ],
      ),
    );
  }
}
