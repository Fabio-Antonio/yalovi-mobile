import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/ui/screens/add_sub_category.dart';
import 'package:platzi_trips_app/clasification/ui/widgets/sub_category_list.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class searchSubCategory extends StatelessWidget {
  String category;
  searchSubCategory({Key? key, required this.category});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            subCategoryList(idCategory: category),
            buttonGreen(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              addSubCategory(category: category)));
                },
                tittle: 'Agregar')
          ],
        ),
        ProfileBackground(),
        Padding(
          padding: EdgeInsets.only(left: 5, bottom: 0, right: 30, top: 20),
          child: ProfileHeader(),
        ),
      ],
    ));
  }
}
