import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/clasification/bloc/bloc_clasification.dart';
import 'package:platzi_trips_app/pedidos/bloc/bloc_pedidos.dart';
import 'package:platzi_trips_app/productos/bloc/bloc_productos.dart';
import 'package:platzi_trips_app/splash_screen.dart';
import 'platzi_trips.dart';
import 'user/bloc/bloc_user.dart';
import 'user/ui/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String descriptionDummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          return BlocProvider(
              child: BlocProvider(
                  child: BlocProvider(
                      child: BlocProvider(
                          child: MaterialApp(
                              title: 'Flutter Demo',
                              theme: ThemeData(
                                // This is the theme of your application.
                                //
                                // Try running your application with "flutter run". You'll see the
                                // application has a blue toolbar. Then, without quitting the app, try
                                // changing the primarySwatch below to Colors.green and then invoke
                                // "hot reload" (press "r" in the console where you ran "flutter run",
                                // or simply save your changes to "hot reload" in a Flutter IDE).
                                // Notice that the counter didn't reset back to zero; the application
                                // is not restarted.
                                primarySwatch: Colors.amber,
                              ),
                              home: SignInScreen()),
                          bloc: productosBloc()),
                      bloc: userBloc()),
                  bloc: clasificationBloc()),
              bloc: pedidosBloc());
        });
  }
}
