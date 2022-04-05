import 'package:flutter/material.dart';
import 'package:platzi_trips_app/clasification/ui/screens/add_category.dart';
import 'package:platzi_trips_app/clasification/ui/screens/search_category.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_trips.dart';
import 'package:platzi_trips_app/user/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/productos/ui/screen/search_trips.dart';
import 'user/ui/screens/profile_trips.dart';

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
    HomeTrips(),
    searchTrips(),
    ProfileTrips()
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
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("")),
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
                color: Colors.blue,
              ),
              child: ProfileHeader(),
            ),
            ListTile(
              title: const Text('Mi cuenta'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addCategory()));
              },
            ),
            ListTile(
              title: const Text('Clasificación'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => searchCategory()));
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
