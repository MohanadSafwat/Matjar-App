import 'package:flutter/material.dart';
import 'login.dart';
import 'signUp.dart';
import 'landingPage.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: "Matjar",
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Navigation",
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LandingPage(),
        '/Login': (context) => Login(),
        '/SignUp': (context) => SignUp(),
        '/Home': (context) => HomePage(),
      },
    );
  }
}
