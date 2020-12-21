import 'package:flutter/material.dart';
import 'package:matjar_login_signup/Cart.dart';
import 'package:matjar_login_signup/emptyCart.dart';
import 'package:matjar_login_signup/items.dart';
import 'package:matjar_login_signup/payment.dart';
import 'package:matjar_login_signup/provider/cartItem.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'signUp.dart';
import 'landingPage.dart';
import 'home.dart';
import 'matjar_icons1.dart';
import 'profileInfo.dart';
import 'matjar_icons.dart';
import 'profileLoggedIn.dart';
import 'profile.dart';
import 'package:matjar_login_signup/emptyCart.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: "Matjar",
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
ChangeNotifierProvider<cartItem>(
  create: (context) => cartItem(),)
 ],
    
    child: MaterialApp(
      //title: "Navigation",
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        Cart.id: (context) => Cart(),
        SelectedItem.id: (context)=> SelectedItem(),
        Payment.id: (context)=> Payment(),
        '/': (context) => LandingPage(),
        '/Login': (context) => Login(),
        '/SignUp': (context) => SignUp(),
        '/Home': (context) => MyHomePage(),
      },
    ),
    );
  }
}
