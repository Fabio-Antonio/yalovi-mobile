import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/old_version/contants.dart';
import 'package:platzi_trips_app/modals/add_to_card_modal.dart';
import 'package:platzi_trips_app/modals/show_filter_Modal.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/ui/screen/vip_product_view.dart';
import 'package:platzi_trips_app/singleton/configuration_singleton.dart';
import 'package:platzi_trips_app/user/ui/animation/fade_animations.dart';
import 'package:platzi_trips_app/productos/ui/screen/search_trips.dart';
import 'package:flutter/material.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({Key? key}) : super(key: key);

  @override
  _HomeShopState createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  final Productosbloc = productosBloc();
  final _configurationSingleton = ConfigurationSingleton.instance;

  List<dynamic> productList = [];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    products();

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<productosBloc>(context);
    return Stack(
      children: <Widget>[
        CustomScrollView(controller: _scrollController, slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            elevation: 0,
            pinned: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 100),
                stretchModes: [
                  StretchMode.zoomBackground,
                  // StretchMode.fadeTitle
                ],
                title: AnimatedOpacity(
                  opacity: _isScrolled ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 500),
                  child: FadeAnimation(
                      1,
                      Text(_configurationSingleton?.configuration?.title??"",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                          ))),
                ),
                background: Image.network(
                  _configurationSingleton?.configuration?.url_image??Constants().url_qa+"/uploads/no-img.png",
                  fit: BoxFit.cover,
                )),
            bottom: AppBar(
              toolbarHeight: 70,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Expanded(
                    child: FadeAnimation(
                        1.4,
                        Container(
                          height: 50,
                          child: TextField(
                            readOnly: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: "Search e.g Cotton Sweatshirt",
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(width: 10),
                  FadeAnimation(
                      1.5,
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            showFilterModal(context);
                          },
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  height: 330,
                  child: Column(children: [
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular Products',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Text(
                                'See all ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              return productCart(productList[index]);
                            }))
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  height: 180,
                  child: Column(children: [
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'For You',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Text(
                                'See all ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              return forYou(productList[index]);
                            }))
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  height: 330,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Winter Collection',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            'See all ',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              return productCart(productList[index]);
                            }))
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  height: 330,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cotton Collection',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            'See all ',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              return productCart(productList[index]);
                            }))
                  ])),
            ]),
          )
        ])
      ],
    );
  }

  void products() async {
    productList = await Productosbloc.getProducts();
  }

  productCart(Producto product) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(
          1.5,
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VipProductView(product: product)));
            },
            child: Container(
              margin: EdgeInsets.only(right: 20, bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 15,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(product.url_imagen,
                                  fit: BoxFit.cover)),
                        ),
                        // Add to cart button
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: MaterialButton(
                            color: Colors.black,
                            minWidth: 45,
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {
                              addToCartModal();
                            },
                            padding: EdgeInsets.all(5),
                            child: Center(
                                child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 20,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.nombre_producto,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.segunda_mano ? "Usado" : "Nuevo",
                        style: TextStyle(
                          color: Colors.orange.shade400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ " + product.precio.toString() + '.00',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  forYou(Producto product) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: FadeAnimation(
          1.5,
          Container(
            margin: EdgeInsets.only(right: 20, bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 15,
                  color: Colors.grey.shade200,
                )
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          Image.network(product.url_imagen, fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.nombre_producto,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.segunda_mano ? "Usado" : "Nuevo",
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ " + product.precio.toString() + '.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ]),
                )
              ],
            ),
          )),
    );
  }

  addToCartModal() {
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: AnimationController(
            duration: Duration(milliseconds: 400), vsync: this),
        builder: (context) => StatefulBuilder(
              builder: (context, setState) {
                return addToCardModal();
              },
            ));
  }

  showFilterModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return ShowFilterModal();
        });
      },
    );
  }
}
