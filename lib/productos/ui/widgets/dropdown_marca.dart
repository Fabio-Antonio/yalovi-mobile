import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';

class dropdown_marca extends StatefulWidget {
  late Marca marcaSelected;
  final ProductosBloc = productosBloc();

  dropdown_marca({Key? key, required this.marcaSelected});

  @override
  _dropdown_marca createState() => _dropdown_marca();
}

class _dropdown_marca extends State<dropdown_marca> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var myProvider = BlocProvider.of<productosBloc>(context);

    return FutureBuilder<List<Marca>>(
        future: widget.ProductosBloc.getMarcas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Container(
                  child: DropdownButton<Marca>(
                    hint: Text(widget.marcaSelected.marca == ''
                        ? "Selecciona una marca"
                        : widget.marcaSelected.marca),
                    items: snapshot.data.map<DropdownMenuItem<Marca>>((value) {
                      return DropdownMenuItem<Marca>(
                          value: value,
                          child: Row(
                            children: <Widget>[
                              Text(value.marca),
                              Icon(Icons.arrow_back_ios_new)
                            ],
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        myProvider.marca = value!;
                        widget.marcaSelected = value;
                      });
                    },
                  ),
                )
              : Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
        });
  }
}
