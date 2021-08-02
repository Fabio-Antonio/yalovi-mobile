import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/model/caracteristicas.dart';
import 'package:platzi_trips_app/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';

class addDetails extends StatelessWidget {
  final _controllercaracteristicaText = TextEditingController();
  late Caracteristica _caracteristica;
  String uid;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  addDetails({Key? key, required this.uid});

  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<userBloc>(context);

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //TextField Title
                      margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
                      child: TextInput(
                        hintText: "Característica",
                        controller: _controllercaracteristicaText,
                        inputType: TextInputType.name,
                        maxLines: 8,
                        onValueChanged: (String value) {},
                      ),
                    ),
                    buttonGreen(
                      onPressed: () {
                        _caracteristica = Caracteristica(
                            producto: uid,
                            caracteristica: _controllercaracteristicaText.text);
                        myProvider.createCaracteristica(_caracteristica).then(
                            (value) => _scaffoldKey.currentState!
                                    .showSnackBar(SnackBar(
                                  content: Text(value),
                                )));
                      },
                      tittle: "Asignar característica",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
