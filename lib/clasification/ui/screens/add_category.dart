import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/bloc/bloc_clasification.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/contants.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';

class addCategory extends StatelessWidget {
  final _controllerDescriptionText = TextEditingController();
  final _controllerCategoriaText = TextEditingController();
  late Category _category;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<clasificationBloc>(context);

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          ProfileBackground(
            sizeScreen: Constants().simpleBar,
          ),
          ListView(
            children: <Widget>[
              ProfileHeader(),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    TextInput(
                      hintText: "Categoría",
                      controller: _controllerCategoriaText,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      onValueChanged: (String value) {},
                    ),
                    SizedBox(height: 10),
                    TextInput(
                      hintText: "Descripción",
                      controller: _controllerDescriptionText,
                      inputType: TextInputType.name,
                      maxLines: 8,
                      onValueChanged: (String value) {},
                    ),
                    buttonGreen(
                      onPressed: () {
                        _category = Category(
                            id: "",
                            categoria: _controllerCategoriaText.text,
                            descripcion: _controllerDescriptionText.text);
                        myProvider.createCategory(_category).then((value) =>
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
