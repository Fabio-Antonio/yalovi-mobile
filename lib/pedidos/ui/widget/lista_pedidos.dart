import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/pedidos/bloc/bloc_pedidos.dart';
import 'package:platzi_trips_app/pedidos/model/pedidos.dart';
import 'package:platzi_trips_app/pedidos/ui/widget/pedidos_card.dart';

class listaPedidos extends StatelessWidget {
  late Pedidos _pedidos;
  String token;
  final PedidosBloc = pedidosBloc();

  listaPedidos({Key? key, required this.token});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<pedidosBloc>(context);
    return FutureBuilder<List<Pedidos>>(
      future: PedidosBloc.getPedidos(token),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          print("no contiene pedidos");
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No hay entregas pedidos")
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
        for (_pedidos in snapshot) pedidosCard(pedido: _pedidos),
      ],
    );
  }
}
