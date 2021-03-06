import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'producto_card.dart';

class listaProductos extends StatelessWidget {
  late Producto _producto;
  final Productosbloc = productosBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<productosBloc>(context);
    return FutureBuilder<List<Producto>>(
      future: Productosbloc.getProduct(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se encontraron productos")
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(top: 280.0),
            child: _buildLista(snapshot.data),
          );
        }
      },
    );
  }

  Widget _buildLista(snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (_producto in snapshot) productoCard(_producto, _producto.id),
      ],
    );
  }
}
