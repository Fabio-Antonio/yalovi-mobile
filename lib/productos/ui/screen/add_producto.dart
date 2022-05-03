import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/productos/ui/widgets/dropdown_marca.dart';
import 'package:platzi_trips_app/productos/ui/widgets/dropdown_sub.dart';
import 'package:platzi_trips_app/widgets/input_text.dart';

class addProducto extends StatefulWidget {
  final _controllerNombreText = TextEditingController();
  final _controllerPrecioText = TextEditingController();
  final _controllerUrlText = TextEditingController();

  late Sub_categoria _sub_categoria;
  late Marca _marca;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _addProducto createState() => _addProducto();
}

class _addProducto extends State<addProducto> {
  bool isSwitched = false;
  var textValue = 'Segunda mano OFF';

  bool isSwitcheds = false;
  var textValues = 'Descuento OFF';
  late Producto _producto;
  void toggleSwitch(bool value) {
    if (isSwitcheds == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Segunda mano ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Segunda mano  OFF';
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchs(bool value) {
    if (isSwitcheds == false) {
      setState(() {
        isSwitcheds = true;
        textValues = 'Descuento ON';
      });
    } else {
      setState(() {
        isSwitcheds = false;
        textValues = 'Descuento  OFF';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<productosBloc>(context);
    widget._sub_categoria = myProvider.sub_categoria;
    widget._marca = myProvider.marca;
    // TODO: implement build
    return Scaffold(
      key: widget._scaffoldKey,
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
                        child: Column(
                          children: <Widget>[
                            TextInput(
                              hintText: "Nombre del producto",
                              controller: widget._controllerNombreText,
                              inputType: TextInputType.name,
                              maxLines: 2,
                              onValueChanged: (String value) {},
                            ),
                            SizedBox(height: 10),
                            TextInput(
                              hintText: "Precio",
                              controller: widget._controllerPrecioText,
                              inputType: TextInputType.number,
                              maxLines: 1,
                              onValueChanged: (String value) {},
                            ),
                            SizedBox(height: 10),
                            TextInput(
                              hintText: "Url imagen",
                              controller: widget._controllerUrlText,
                              inputType: TextInputType.url,
                              maxLines: 3,
                              onValueChanged: (String value) {},
                            ),
                            SizedBox(height: 10),
                            dropdown_sub(sub_categoria: widget._sub_categoria),
                            SizedBox(height: 10),
                            dropdown_marca(
                              marcaSelected: widget._marca,
                            ),
                            SizedBox(height: 10),
                            Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            ),
                            Text(
                              '$textValue',
                              style: TextStyle(fontSize: 20),
                            ),
                            Switch(
                              onChanged: toggleSwitchs,
                              value: isSwitcheds,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            ),
                            Text(
                              '$textValues',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )),
                    buttonGreen(
                      onPressed: () {
                        int s = int.parse(widget._controllerPrecioText.text);
                        _producto = Producto(
                            id: "p",
                            segunda_mano: isSwitched,
                            descuento: isSwitcheds,
                            sub_categoria: myProvider.sub_categoria.id,
                            nombre_producto: widget._controllerNombreText.text,
                            precio: s,
                            marca: myProvider.marca.id,
                            url_imagen: widget._controllerUrlText.text);
                        myProvider.createProduct(_producto).then((value) =>
                            widget._scaffoldKey.currentState!
                                .showSnackBar(SnackBar(content: Text(value)))
                                .closed
                                .then((SnackBarClosedReason reason) {
                              Navigator.of(context).pop();
                            }));
                      },
                      tittle: "Crear producto",
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
