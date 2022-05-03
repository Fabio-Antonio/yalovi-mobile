import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';

class dropdown_sub extends StatefulWidget {
  final ProductosBloc = productosBloc();
  Sub_categoria sub_categoria;
  dropdown_sub({Key? key, required this.sub_categoria});

  @override
  _dropdown_sub createState() => _dropdown_sub();
}

class _dropdown_sub extends State<dropdown_sub> {
  String drop = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var myProvider = BlocProvider.of<productosBloc>(context);

    return FutureBuilder<List<Sub_categoria>>(
      future: widget.ProductosBloc.getSubcat(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                child: DropdownButton<Sub_categoria>(
                  hint: Text(widget.sub_categoria.sub_categoria == ''
                      ? "Seleccione una sub categoría"
                      : widget.sub_categoria.sub_categoria),
                  items: snapshot.data
                      .map<DropdownMenuItem<Sub_categoria>>((value) {
                    return DropdownMenuItem<Sub_categoria>(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Text(value.sub_categoria),
                            Icon(Icons.arrow_back_ios_new),
                          ],
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      myProvider.sub_categoria = value!;
                      widget.sub_categoria = value;
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
