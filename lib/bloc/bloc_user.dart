import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/productos/repository/caracteristicas_repository.dart';
import 'package:platzi_trips_app/productos/repository/colores_repository.dart';
import 'package:platzi_trips_app/productos/repository/imagenes_repository.dart';
import 'package:platzi_trips_app/productos/repository/marcas_repository.dart';
import 'package:platzi_trips_app/pedidos/repository/pedidos_repository.dart';
import 'package:platzi_trips_app/productos/repository/sub_cat_repository.dart';
import 'package:platzi_trips_app/pedidos/repository/ventas_repository.dart';
import 'package:platzi_trips_app/productos/model/caracteristicas.dart';
import 'package:platzi_trips_app/productos/model/color_c.dart';
import 'package:platzi_trips_app/productos/model/imagen.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';
import 'package:platzi_trips_app/pedidos/model/pedidos.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/model/color.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';
import 'package:platzi_trips_app/pedidos/model/ventas.dart';
import '../repository/auth_repository.dart';
import 'package:platzi_trips_app/productos/repository/productos_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:location_permissions/location_permissions.dart';
import 'package:geocoding/geocoding.dart';

class userBloc with ChangeNotifier implements Bloc {
  final _auth_repository = authRepository();
  final _productos_repository = productosRepository();
  final _imagenesRepository = imagenesRepository();
  final _caracteristicaRepository = caracteristicasRepository();
  final _coloresRepository = coloresRepository();
  final _marcasRepository = marcasRepository();
  final _subCatRepository = subCatRepository();
  final _ventasRepository = ventasRepository();
  final _pedidosRepository = pedidosRepository();

  String url = "";

  late Colores colores = Colores(id: "", color: "");
  late Marca marca = Marca(id: "", marca: "");
  late Sub_categoria sub_categoria =
      Sub_categoria(id: "", categoria: "", sub_categoria: "");

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

  Colores get _colores => colores;
  Sub_categoria get _sub_categoria => sub_categoria;
  set mySubCat(Sub_categoria _sub_categoria) {
    this.sub_categoria = _sub_categoria;
    notifyListeners();
  }

  set myColores(Colores _colores) {
    this.colores = _colores;
    notifyListeners();
  }

  String get _url => url;

  set miUrl(String url) {
    this.url = url; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<UserCredential> signInWithGoogle() {
    return _auth_repository.signInFirebase();
  }

  Future<List<Producto>> getProduct() async {
    return await _productos_repository.getProductos();
  }

  Future<List<Colores>> getColores() async {
    return await _coloresRepository.getColores();
  }

  Future<List<Marca>> getMarcas() async {
    return await _marcasRepository.getMarcas();
  }

  Future<List<Sub_categoria>> getSubcat() async {
    return await _subCatRepository.getSubCat();
  }

  Future<List<Ventas>> getVentas(String _status) async {
    return await _ventasRepository.getVentas(_status);
  }

  Future<String> updateVentas(String _token, String _status) async {
    return await _ventasRepository.updateVentas(_token, _status);
  }

  Future<List<Pedidos>> getPedidos(String _token) async {
    return await _pedidosRepository.getPedidos(_token);
  }

  Future<String> createImage(Imagen _imagen) async {
    return await _imagenesRepository.createImage(_imagen);
  }

  Future<String> createColores(Colores_c _color_c) async {
    return await _coloresRepository.createColores(_color_c);
  }

  Future<String> createCaracteristica(Caracteristica _caracteristica) async {
    return await _caracteristicaRepository
        .createCaracteristica(_caracteristica);
  }

  Future<String> createProduct(Producto _producto) async {
    return _productos_repository.createProducto(_producto);
  }

  Future<List<Location>> locations(String _location) async {
    return await locationFromAddress(_location);
  }

  Future<PermissionStatus> permission() async {
    return await LocationPermissions().requestPermissions();
  }

  signOut() {
    _auth_repository.singOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
