import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:platzi_trips_app/pedidos/model/pedidos.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import 'package:platzi_trips_app/pedidos/repository/pedidos_repository.dart';
import 'package:platzi_trips_app/pedidos/repository/ventas_repository.dart';

class pedidosBloc with ChangeNotifier implements Bloc {
  double latitud = 0;
  double longitud = 0;

  double get _latitud => latitud;
  set myLatitud(double latitud) {
    this.latitud = latitud;
  }

  double get _longitud => longitud;
  set myLongitud(double longitud) {
    this.longitud = longitud;
  }

  final _ventasRepository = ventasRepository();
  final _pedidosRepository = pedidosRepository();

  Future<List<Ventas>> getVentas(String _status) async {
    return await _ventasRepository.getVentas(_status);
  }

  Future<String> updateVentas(String _token, String _status) async {
    return await _ventasRepository.updateVentas(_token, _status);
  }

  Future<List<Pedidos>> getPedidos(String _token) async {
    return await _pedidosRepository.getPedidos(_token);
  }

  Future<List<Location>> locations(String _location) async {
    return await locationFromAddress(_location);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
