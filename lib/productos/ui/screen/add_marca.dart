import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';

class addMarca extends StatelessWidget {
  final _controllerSubCategoriaText = TextEditingController();
  late Marca _marca;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    TextInput(
                      hintText: "Marca",
                      controller: _controllerSubCategoriaText,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      onValueChanged: (String value) {},
                    ),
                    SizedBox(height: 10),
                    buttonGreen(
                      onPressed: () {
                        _marca = Marca(
                            id: "", marca: _controllerSubCategoriaText.text);
                        myProvider.createMarca(_marca).then((value) =>
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text(value),
                            )));
                      },
                      tittle: "Crear",
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
