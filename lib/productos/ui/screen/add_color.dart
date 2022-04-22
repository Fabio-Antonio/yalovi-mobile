import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/selections.dart';
import 'package:platzi_trips_app/productos/model/color_c.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/productos/ui/widgets/dropdown.dart';

class addColor extends StatefulWidget {
  final ProductosBloc = productosBloc();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String uid;
  late Colores_c _colores_c;
  addColor({Key? key, required this.uid});

  @override
  _addColor createState() => _addColor();
}

class _addColor extends State<addColor> {
  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<productosBloc>(context);
    late Colores _color;

    _color = myProvider.colores;
    return Scaffold(
      key: widget._scaffoldKey,
      body: Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //TextField Title
                      margin: EdgeInsets.only(top: 90.0, bottom: 10.0),
                      child: dropdown(
                        color: _color,
                        onValueChanged: (Colores? val) {
                          setState(() {
                            _color = val!;
                            myProvider.colores = val;
                            widget._scaffoldKey.currentState!
                                .showSnackBar(SnackBar(
                              content: Text(myProvider.colores.name),
                            ));
                          });
                        },
                      ),
                    ),
                    buttonGreen(
                      onPressed: () {
                        widget._colores_c = Colores_c(
                            id: widget.uid,
                            name: myProvider.colores.name,
                            code: myProvider.colores.code);
                        myProvider.createColores(widget._colores_c).then(
                            (value) => widget._scaffoldKey.currentState!
                                    .showSnackBar(SnackBar(
                                  content: Text(value),
                                )));
                      },
                      tittle: "Asignar color",
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
