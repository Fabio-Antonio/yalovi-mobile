import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';

class dropdown_sub extends StatefulWidget {
  final ValueChanged<Sub_categoria?>? onValueChanged;
  final ProductosBloc = productosBloc();
  Sub_categoria sub_categoria;
  dropdown_sub(
      {Key? key, required this.onValueChanged, required this.sub_categoria});

  @override
  _dropdown_sub createState() => _dropdown_sub();
}

class _dropdown_sub extends State<dropdown_sub> {
  String drop = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BlocProvider.of<productosBloc>(context);

    return FutureBuilder<List<Sub_categoria>>(
      future: widget.ProductosBloc.getSubcat(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasError || snapshot.hasData || snapshot.data == null) {
          return _buildDropdown(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDropdown(List<Sub_categoria> snapshot) {
    if (snapshot == null) {
      return CircularProgressIndicator();
    } else {
      return DropdownButton<Sub_categoria?>(
        value: snapshot[0],
        icon: Icon(Icons.arrow_circle_down_outlined),
        hint: Text('Seleccione la categoría'),
        items: snapshot.map((Sub_categoria value) {
          return DropdownMenuItem<Sub_categoria>(
              value: value,
              child: Row(
                children: <Widget>[
                  Text(value.sub_categoria),
                  Icon(Icons.arrow_back_ios_new)
                ],
              ));
        }).toList(),
        onChanged: widget.onValueChanged,
      );
    }
  }
}
