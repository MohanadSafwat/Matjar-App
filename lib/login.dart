//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'auth/auth.dart';
import 'firebase/userDatabase.dart';

//import 'modules/user.dart';
//import 'package:matjar_login_signup/Classes/auth.dart';

var white = Colors.white;

final Future<FirebaseApp> _init = Firebase.initializeApp();

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  void initState() {
    super.initState();
  }

  int currentIndex = 3;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DatabaseService databaseService;
  var x, y;
  String uid, error = "";
  bool exist = false;
  bool lastDoc = false;
  FirebaseAuth fAuth;

  FirebaseFirestore fStore;

  /* Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((userCredential) {
        Navigator.of(context).pushNamed('/ProfileLoggedIn');
      });
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            "Matjar",
            style: TextStyle(
              fontSize: 40,
              fontFamily: "DancingScript",
            ),
          ),
          backgroundColor: mainColor,
          toolbarHeight: 80,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedFontSize: 13,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Matjar.home,
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Matjar.categories,
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Matjar.cart,
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Matjar.sign_in_and_sign_up_logo,
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              label: "",
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
              if (currentIndex == 3) {
                Navigator.of(context).pushNamed('/Profile');
              }
            });
          },
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
          //height: 700,
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 25,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
////////////////////////////////////////// validation text error

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        error,
                        style: TextStyle(
                          fontSize: 15,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password",
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () => print("forget"),
                      ),
                    ),
                    Container(
                      width: 290.0,
                      height: 50,
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ButtonTheme(
                              child: ElevatedButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 25,
                                  ),
                                ),
                                onPressed: () async {
                                  //*************************************************************************************** */

                                  /* if(_passwordController.text.length < 6){
                    print("Password Must be >= 6 Characters");
                    return;
                }
                  StreamBuilder(

             // ignore: deprecated_member_use
             stream :    Firestore.instance.collection('Users').snapshots()
                  , builder:(context,snapshot)  {

                       x =  snapshot.data['email'] ;






                  },

                  );*/

                                  try {
                                    final UserRef = await Firestore.instance
                                        .collection('Users')
                                        // ignore: deprecated_member_use
                                        .getDocuments()
                                        .then((QuerySnapshot snapshot) {
                                      // ignore: deprecated_member_use
                                      snapshot.documents
                                          .forEach((DocumentSnapshot doc) {
                                        x = doc.data()['email'].toString();

                                        if (x == _emailController.text) {
                                          exist = true;
                                        }
                                        if (doc.id == "zzzzzzzzzz") {
                                          lastDoc = true;
                                        }
                                      });
                                    });
                                  } on FirebaseAuthException catch (e) {}

//******************************************************************************************************* */

                                  if (lastDoc) {
                                    lastDoc = false;
                                    if (exist) {
                                      exist = false;
                                      dynamic result = await AuthService()
                                          .login(_emailController.text,
                                              _passwordController.text);

                                      Navigator.of(context).pushNamed('/Home');
                                    } else {
                                      setState(() {
                                        error = " invalid email or password ";
                                      });
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          mainColor),
                                ),
                              ),
                            );
                          }),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/SignUp'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: TextButton(
                        child: Text(
                          "Login as seller?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/LoginSeller'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
