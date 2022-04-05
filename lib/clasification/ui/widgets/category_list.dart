import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/bloc/bloc_clasification.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/clasification/ui/widgets/category_card.dart';

class categoryList extends StatelessWidget {
  late Category _category;
  final ClasificationBloc = clasificationBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<clasificationBloc>(context);
    return FutureBuilder<List<Category>>(
      future: ClasificationBloc.getCat(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se encontraron caegorías")
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        for (_category in snapshot)
          categoryCard(_category, _category.categoria),
      ],
    );
  }
}
