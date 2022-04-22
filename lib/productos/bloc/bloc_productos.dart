import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/productos/model/caracteristicas.dart';
import 'package:platzi_trips_app/clasification/model/category.dart';
import 'package:platzi_trips_app/productos/model/selections.dart';
import 'package:platzi_trips_app/productos/model/color_c.dart';
import 'package:platzi_trips_app/productos/model/imagen.dart';
import 'package:platzi_trips_app/productos/model/marca.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/model/sub_categoria.dart';
import 'package:platzi_trips_app/productos/repository/caracteristicas_repository.dart';
import 'package:platzi_trips_app/clasification/repository/categoria_repository.dart';
import 'package:platzi_trips_app/productos/repository/colores_repository.dart';
import 'package:platzi_trips_app/productos/repository/imagenes_repository.dart';
import 'package:platzi_trips_app/productos/repository/marcas_repository.dart';
import 'package:platzi_trips_app/productos/repository/productos_repository.dart';
import 'package:platzi_trips_app/productos/repository/sub_cat_repository.dart';

class productosBloc with ChangeNotifier implements Bloc {
  final _productos_repository = productosRepository();
  final _imagenesRepository = imagenesRepository();
  final _caracteristicaRepository = caracteristicasRepository();
  final _coloresRepository = coloresRepository();
  final _marcasRepository = marcasRepository();
  final _subCatRepository = subCatRepository();

  String url = "";

  late Colores colores = Colores(name: "", code: "");
  late Marca marca = Marca(id: "", marca: "");
  late Sub_categoria sub_categoria =
      Sub_categoria(id: "", categoria: "", sub_categoria: "");

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

  Future<List<Producto>> getProduct() async {
    return await _productos_repository.getProductos();
  }

  Future<List<Colores>> getColores() async {
    return await _coloresRepository.getColores();
  }

  Future<List<Marca>> getMarcas() async {
    return await _marcasRepository.getMarcas();
  }

  Future<String> createMarca(Marca _marca) async {
    return await _marcasRepository.createMarca(_marca);
  }

  Future<List<Sub_categoria>> getSubcat() async {
    return await _subCatRepository.getSubCat();
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
    return await _productos_repository.createProducto(_producto);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
