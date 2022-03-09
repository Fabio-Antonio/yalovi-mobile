import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/color.dart';

class dropdown extends StatefulWidget {
  final ProductosBloc = productosBloc();

  late Colores color;
  final ValueChanged<Colores?>? onValueChanged;

  dropdown({Key? key, required this.onValueChanged, required this.color});

  @override
  _dropdown createState() => _dropdown();
}

class _dropdown extends State<dropdown> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<productosBloc>(context);
    // TODO: implement build

    return FutureBuilder<List<Colores>>(
      future: widget.ProductosBloc.getColores(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasError || snapshot.hasData || snapshot.data == null) {
          return _buildDropdown(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDropdown(List<Colores> snapshot) {
    if (snapshot == null) {
      return CircularProgressIndicator();
    } else {
      return DropdownButton<Colores>(
        value: snapshot.first,
        icon: Icon(Icons.arrow_circle_down_outlined),
        hint: Text('Seleccione un color'),
        items: snapshot.map((Colores value) {
          return DropdownMenuItem<Colores>(
              value: value,
              child: Row(
                children: <Widget>[
                  Text(value.color),
                  Icon(Icons.arrow_back_ios_new)
                ],
              ));
        }).toList(),
        onChanged: widget.onValueChanged,
      );
    }
  }
}
