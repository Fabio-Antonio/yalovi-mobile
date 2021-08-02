import 'dart:async';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'package:geocoding/geocoding.dart';
import 'package:platzi_trips_app/bloc/bloc_user.dart';
import 'package:platzi_trips_app/ui/modals/modal.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class Home extends StatefulWidget {
  String address;
  String token;
  Home({Key? key, required this.address, required this.token});
  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  final UserBloc = userBloc();

  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(19.442974161976036, -99.13336345152011));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _defaultMapType = MapType.normal;

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<userBloc>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    List<Marker> _markers = <Marker>[];
    UserBloc.locations(widget.address)
        .then((List<Location> value) => setState(() {
              UserBloc.latitud = value[0].latitude;
              UserBloc.longitud = value[0].longitude;
            }));

    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(UserBloc.latitud, UserBloc.longitud),
        infoWindow: InfoWindow(title: widget.address)));

    return Scaffold(
      appBar: AppBar(
        title: Text('Dirigete al punto de entrega'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: _defaultMapType,
            markers: Set<Marker>.of(_markers),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: _initialPosition,
          ),
          Container(
              margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: Colors.teal[200],
                    onPressed: () {
                      _changeMapType();
                      print('Changing the Map Type');
                    })
              ])),
          buttonGreen(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ModalDialog(
                          onPressed: () {
                            UserBloc.updateVentas(widget.token, "Completado")
                                .then((value) => Navigator.of(context).pop());
                          },
                          title: "¿Desea finalizar?",
                          action: "Finalizar");
                    });
              },
              tittle: "Completado")
        ],
      ),
    );
  }
}
