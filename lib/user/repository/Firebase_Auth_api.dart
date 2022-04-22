import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:platzi_trips_app/enviroment.dart';
import 'package:platzi_trips_app/user/model/user.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final String apiUrl = Enviroment().url_qa + "/auth";

  Future<user> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final _user = new user(
        name: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        photoURL: "http://url/prueba.png",
        phoneNumber: "+525513658263");
    return _user;
    // Once signed in, return the UserCredential
  }

  Future<String> generateToken(user _user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': _user.name,
        'email': _user.email,
        'photoURL': _user.photoURL,
        'phoneNumber': _user.phoneNumber!
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body)["token"];
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body)["msg"];
    } else if (response.statusCode == 422) {
      return jsonDecode(response.body)["msg"];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  singnOut() async {
    await _auth.signOut().then((value) => print("Sesion cerrada"));
    googleSignIn.signOut();
  }
}
