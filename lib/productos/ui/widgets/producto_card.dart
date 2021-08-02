import 'package:flutter/material.dart';
import 'package:platzi_trips_app/productos/ui/screen/add_color.dart';
import 'package:platzi_trips_app/productos/ui/screen/add_details.dart';
import 'package:platzi_trips_app/productos/ui/screen/add_imagen.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';

class productoCard extends StatelessWidget {
  Producto _producto;
  String herotag;
  int i = 0;
  productoCard(@required this._producto, @required this.herotag);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final nombreProducto = SizedBox(
      width: 250.0,
      child: Text(
        _producto.nombre_producto,
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
        '\$' + _producto.precio.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13.0, color: Color(0xFFa3a5a7)),
      ),
    );
    final buttonsAction = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButtonGreen(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addImagen(
                          uid: _producto.id,
                        )));
          },
          iconData: Icons.add_a_photo,
          tag: "img$herotag",
        ),
        FloatingActionButtonGreen(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addDetails(
                          uid: _producto.id,
                        )));
          },
          iconData: Icons.article,
          tag: "ca$herotag",
        ),
        FloatingActionButtonGreen(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addColor(
                          uid: _producto.id,
                        )));
          },
          iconData: Icons.color_lens,
          tag: "co$herotag",
        )
      ],
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[nombreProducto, precioProducto, buttonsAction],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(_producto.url_imagen))),
    );

    return Row(
      children: <Widget>[photo, userDetails],
    );
  }
}
