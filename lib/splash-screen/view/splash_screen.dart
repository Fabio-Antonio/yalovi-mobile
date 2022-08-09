

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/splash-screen/model/apis/api_response.dart';
import 'package:platzi_trips_app/user/ui/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../view-model/configuration_view_model.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ConfigurationViewModel>(context,listen: true);
    ApiResponse apiResponse = myProvider.response;
    myProvider.fetchMediaData();

    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;

    if(apiResponse.status==Status.COMPLETED){
      myProvider.dispose();
      return SignInScreen();
    }
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xFFF09F00) : const Color(0xFFF09F00),
      body: Center(
          child:getConfigurationWidget(apiResponse),
    ));
  }


  Widget getConfigurationWidget( ApiResponse apiResponse){
    var message = apiResponse.message??"";
    switch (apiResponse.status) {
      case Status.LOADING:
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              Center(
                child: Text(message,
                  style: TextStyle(
                      fontSize: 28.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]);
      case Status.ERROR:
        return Center(
          child: Text('No se pudo cargar las configuraciones \n intente más tarde.',
              style: TextStyle(
              fontSize: 28.0,
              fontFamily: "Lato",
              color: Colors.white,
              fontWeight: FontWeight.bold)),
        );
      case Status.INITIAL:
      default:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Center(child: CircularProgressIndicator()),
          Center(
          child: Text(message,
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold),),
        )
    ]);
    }
  }
}

class Init {
  Init._();
  static final instance = Init._();
  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
