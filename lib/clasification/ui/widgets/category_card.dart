import 'package:flutter/material.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/clasification/ui/screens/add_category.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class categoryCard extends StatelessWidget {
  Category _category;
  String herotag;
  int i = 0;
  categoryCard(@required this._category, @required this.herotag);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final nombreProducto = SizedBox(
        width: 350.0,
        child: Padding(
          padding: EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 0),
          child: Text(
            _category.categoria,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "Lato"),
          ),
        ));

    final buttonsAction = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButtonGreen(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => addCategory()));
          },
          iconData: Icons.adb_sharp,
          tag: "img$herotag",
        ),
      ],
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[nombreProducto, buttonsAction],
    );

    /* final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(_producto.url_imagen))),
    );*/

    return Row(
      children: <Widget>[userDetails],
    );
  }
}
