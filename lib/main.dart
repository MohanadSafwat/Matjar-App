import 'package:flutter/material.dart';
import 'package:matjar_login_signup/UI/login.dart';
import 'package:matjar_login_signup/UI/signUp.dart';

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
        '/': (context) => Login(),
        '/SignUp': (context) => SignUp(),
      },
    );
  }
}
