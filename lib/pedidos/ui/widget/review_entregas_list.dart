import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/pedidos/bloc/bloc_pedidos.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import 'package:platzi_trips_app/pedidos/ui/widget/review_entregas.dart';

class reviewEntregasList extends StatelessWidget {
  late Ventas _ventas;
  final Pedidosbloc = pedidosBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<pedidosBloc>(context);
    return FutureBuilder<List<Ventas>>(
      future: Pedidosbloc.getVentas("Entrega"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No hay entregas pendientes")
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
        for (_ventas in snapshot) reviewEntregas(ventas: _ventas),
      ],
    );
  }
}
