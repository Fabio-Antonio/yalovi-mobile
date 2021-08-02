import 'package:flutter/material.dart';
import 'package:platzi_trips_app/pedidos/model/pedidos.dart';

class pedidosCard extends StatelessWidget {
  Pedidos pedido;
  pedidosCard({Key? key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final nombreProducto = SizedBox(
      width: 250.0,
      child: Text(
        pedido.nombre_producto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
            fontFamily: "Lato"),
      ),
    );

    final precioProducto = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Precio: " + '\$' + pedido.precio.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final colorProducto = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Color :" + pedido.color,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final cantidad = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        "Cantidad: " +
            pedido.cantidad.toString() +
            " total:" +
            '\$' +
            (pedido.precio * pedido.cantidad).toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        nombreProducto,
        precioProducto,
        cantidad,
        colorProducto
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(pedido.url_imagen))),
    );

    return Row(
      children: <Widget>[photo, userDetails],
    );
  }
}
