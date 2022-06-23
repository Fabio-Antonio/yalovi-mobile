import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/productos/model/producto.dart';
import 'package:platzi_trips_app/productos/ui/screen/home_shop.dart';
import 'package:platzi_trips_app/user/ui/animation/fade_animations.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProduct();
}

class _SearchProduct extends State<SearchProduct>
    with TickerProviderStateMixin {
  late List<Producto> cartItems = [];
  List<int> cartItemCount = [1, 1, 1, 1];
  int totalPrice = 0;
  final Productosbloc = productosBloc();

  Future<void> fetchItems() async {
    cartItems = sumTotal();
  }

  sumTotal() {
    cartItems.forEach((item) {
      totalPrice = item.precio + totalPrice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchItems().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<productosBloc>(context);
    return FutureBuilder<List<Producto>>(
      future: Productosbloc.getProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 300.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se encontraron productos")
              ],
            ),
          );
        } else {
          cartItems = snapshot.data;
          return buildList(cartItems);
        }
      },
    );
  }

  Widget buildList(cartItems) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Expanded(
                  child: FadeAnimation(
                      1.4,
                      Container(
                        height: 50,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search, color: Colors.black),
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
              ],
            ),
            leading: BackButton(
              color: Colors.black,
            )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.79,
            child: cartItems.length > 0
                ? FadeAnimation(
                    1.4,
                    AnimatedList(
                        scrollDirection: Axis.vertical,
                        initialItemCount: cartItems.length,
                        itemBuilder: (context, index, animation) {
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: [
                              MaterialButton(
                                color: Colors.red.withOpacity(0.15),
                                elevation: 0,
                                height: 60,
                                minWidth: 60,
                                shape: CircleBorder(),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    totalPrice = totalPrice -
                                        (int.parse(cartItems[index]
                                                .precio
                                                .toString()) *
                                            cartItemCount[index]);

                                    AnimatedList.of(context).removeItem(index,
                                        (context, animation) {
                                      return cartItem(
                                          cartItems[index], index, animation);
                                    });

                                    cartItems.removeAt(index);
                                    cartItemCount.removeAt(index);
                                  });
                                },
                              ),
                            ],
                            child: cartItem(cartItems[index], index, animation),
                          );
                        }),
                  )
                : Container(),
          ),
        ]));
  }

  cartItem(Producto product, int index, animation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeShop()));
      },
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.url_imagen,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.segunda_mano ? "Usado" : "nuevo",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.nombre_producto,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '\$${product.precio}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
