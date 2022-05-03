import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/selections.dart';

class dropdown extends StatefulWidget {
  final ProductosBloc = productosBloc();

  late Colores color;

  dropdown({Key? key, required this.color});

  @override
  _dropdown createState() => _dropdown();
}

class _dropdown extends State<dropdown> {
  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<productosBloc>(context);
    // TODO: implement build

    return FutureBuilder<List<Colores>>(
      future: widget.ProductosBloc.getColores(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                child: DropdownButton<Colores>(
                  hint: Text(widget.color.name == ''
                      ? "Seleccione un color"
                      : widget.color.name),
                  items: snapshot.data.map<DropdownMenuItem<Colores>>((value) {
                    return DropdownMenuItem<Colores>(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Text(value.name),
                            Icon(Icons.arrow_back_ios_new)
                          ],
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      myProvider.colores = value!;
                      widget.color = value;
                    });
                  },
                ),
              )
            : Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
      },
    );
  }
}
