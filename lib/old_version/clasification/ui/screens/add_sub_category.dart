import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/bloc/bloc_clasification.dart';
import 'package:platzi_trips_app/clasification/model/sub_category.dart';
import 'package:platzi_trips_app/old_version/contants.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';

class addSubCategory extends StatelessWidget {
  final _controllerSubCategoriaText = TextEditingController();
  late Sub_category _sub_category;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String category;
  addSubCategory({Key? key, required this.category});

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
                      hintText: "Sub categoría",
                      controller: _controllerSubCategoriaText,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      onValueChanged: (String value) {},
                    ),
                    SizedBox(height: 10),
                    buttonGreen(
                      onPressed: () {
                        _sub_category = Sub_category(
                            id: "",
                            categoria: category,
                            sub_categoria: _controllerSubCategoriaText.text);
                        myProvider.createSubCategory(_sub_category).then(
                            (value) => _scaffoldKey.currentState!
                                    .showSnackBar(SnackBar(
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
