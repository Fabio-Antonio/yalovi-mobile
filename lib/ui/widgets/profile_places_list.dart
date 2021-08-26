import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/ui/model/analytics.dart';
import 'profile_place.dart';
import '../model/place.dart';

class ProfilePlacesList extends StatelessWidget {
  late Analytics _analytics;
  final UserBloc = userBloc();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);
    return FutureBuilder<List<Analytics>>(
      future: UserBloc.getAnalytics(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se analiticos")
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(top: 25.0),
            child: _buildCards(snapshot.data),
          );
        }
      },
    );
  }

  Widget _buildCards(snapshot) {
    _analytics = Analytics(
        compras: snapshot[0].compras,
        entregas: snapshot[0].entregas,
        completado: snapshot[0].completado,
        total: snapshot[0].total);

    Place place = new Place(
        'Progreso de entregas',
        'A compra' + " " + _analytics.compras.toString(),
        'Listas para entregar' + " " + _analytics.entregas.toString(),
        "Completados: " +
            _analytics.completado.toString() +
            "/" +
            (_analytics.entregas + _analytics.compras + _analytics.completado)
                .toString());
    Place place2 = new Place(
        'Credito Acumulado',
        'Tu saldo acumulado en tu cuenta',
        'Banco Azteca',
        '\$' + _analytics.total.toString());

    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxkm-zGTNQTnFHim99iY1LaODAynAYD_3GSw&usqp=CAU',
              place),
          ProfilePlace(
              'https://media-exp1.licdn.com/dms/image/C560BAQH7fKrEl-dc5g/company-logo_200_200/0/1572976929843?e=2159024400&v=beta&t=kcDuEE4qljOAqIM7cx3Psvv9Fuh2gsPAkZMomDmZQjo',
              place2),
        ],
      ),
    );
  }
}
