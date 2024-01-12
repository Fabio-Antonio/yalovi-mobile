import 'package:flutter/material.dart';
import 'package:platzi_trips_app/productos/ui/screen/add_producto.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final crear = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.add,
        color: Color(0xFFf2C611),
      ),
    );

    final modificar = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.adjust,
        color: Color(0xFFf2C611),
      ),
    );

    final eliminar = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.delete,
        color: Color(0xFFf2C611),
      ),
    );

    final analitica = Container(
      margin: EdgeInsets.only(top: 323.0, right: 3.0),
      child: Icon(
        Icons.analytics,
        color: Color(0xFFf2C611),
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 320.0, left: 20.0, right: 20.0),
          child: Text(
            namePlace,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[crear, modificar, eliminar, analitica],
        )
      ],
    );

    return Column(
      children: <Widget>[
        title_stars,
        buttonGreen(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addProducto()));
            },
            tittle: "Nuevo Producto")
      ],
    );
  }
}
