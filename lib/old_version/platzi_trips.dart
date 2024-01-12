import 'package:flutter/material.dart';
import 'package:platzi_trips_app/old_version/home_partner.dart';
import 'package:platzi_trips_app/productos/ui/screen/product_cart.dart';
import 'package:platzi_trips_app/productos/ui/screen/search_product.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/productos/ui/screen/home_shop.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  final UserBloc = userBloc();
  final List<Widget> widgetsChildren = [
    HomeShop(),
    SearchProduct(),
    ProductCart()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ""),
            ]),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  gradient: LinearGradient(
                      colors: [Colors.amberAccent, Colors.amber],
                      begin: FractionalOffset(0.2, 0.0),
                      end: FractionalOffset(1.0, 0.6),
                      stops: [0.0, 0.6],
                      tileMode: TileMode.clamp)),
              child: ProfileHeader(),
            ),
            ListTile(
              title: const Text('Mi cuenta'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePartner()));
              },
            ),
            ListTile(
              title: const Text('Socio'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePartner()));
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                UserBloc.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
