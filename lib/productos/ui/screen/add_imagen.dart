import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/imagen.dart';
import 'package:platzi_trips_app/ui/model/user.dart';
import 'package:platzi_trips_app/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/widgets/photo_card.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';
import 'package:platzi_trips_app/ui/widgets/profile_background.dart';

class addImagen extends StatefulWidget {
  late Imagen _imagen;
  final _controllerUrlText = TextEditingController();
  String uid;
  String image = "";
  addImagen({Key? key, required this.uid});

  @override
  _addImagen createState() => _addImagen();
}

class _addImagen extends State<addImagen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//Assing this key to the scaffold

  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<productosBloc>(context);
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
                    photoCard(image: widget.image = myProvider.url),
                    Container(
                      //TextField Title
                      margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
                      child: TextInput(
                        hintText: "url imagen",
                        controller: widget._controllerUrlText,
                        inputType: TextInputType.name,
                        maxLines: 3,
                        onValueChanged: (text) => {
                          myProvider.url = text,
                          setState(() {
                            widget.image = myProvider.url;
                          })
                        },
                      ),
                    ),
                    buttonGreen(
                      onPressed: () {
                        widget._imagen = Imagen(
                            producto: widget.uid,
                            url_imagen: widget._controllerUrlText.text);
                        myProvider.createImage(widget._imagen).then((value) =>
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text(value),
                            )));
                      },
                      tittle: "Asignar imagen",
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
