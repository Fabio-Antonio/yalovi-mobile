import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';

class dropdown_marca extends StatefulWidget {
  final ValueChanged<Marca?>? onValueChanged;
  final UserBloc = userBloc();
  Marca marca;

  dropdown_marca({Key? key, required this.onValueChanged, required this.marca});

  @override
  _dropdown_marca createState() => _dropdown_marca();
}

class _dropdown_marca extends State<dropdown_marca> {
  String drop = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BlocProvider.of<userBloc>(context);

    return FutureBuilder<List<Marca>>(
      future: widget.UserBloc.getMarcas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasError || snapshot.hasData || snapshot.data == null) {
          return _buildDropdown(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDropdown(List<Marca> snapshot) {
    if (snapshot == null) {
      return CircularProgressIndicator();
    } else {
      return DropdownButton<Marca>(
        value: snapshot[0],
        icon: Icon(Icons.arrow_circle_down_outlined),
        hint: Text('Seleccione la marca'),
        items: snapshot.map((Marca value) {
          return DropdownMenuItem<Marca>(
              value: value,
              child: Row(
                children: <Widget>[
                  Text(value.marca),
                  Icon(Icons.arrow_back_ios_new)
                ],
              ));
        }).toList(),
        onChanged: widget.onValueChanged,
      );
    }
  }
}
