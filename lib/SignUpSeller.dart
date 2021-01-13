import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/auth/auth.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'categories.dart';
import 'firebase/userDatabase.dart';
import 'home.dart';
import 'login.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'modules/user.dart';

class SignUpSeller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpSeller();
  }
}

class _SignUpSeller extends State<SignUpSeller> {
  int currentIndex = 3;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var x, y;
  String uid, error = "", passError = "";
  bool notexist = true;
  bool lastDoc = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);

    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userData = snapshot.data;
            Color linkColor = (!userData.darkmode)
                ? Color.fromRGBO(83, 169, 252, 1)
                : Color.fromRGBO(83, 169, 252, 1);
            Color textColor =
                (!userData.darkmode) ? Colors.black : Colors.white;
            Color boxShadowColor = (!userData.darkmode)
                ? Colors.grey.withOpacity(0.16)
                : Colors.white.withOpacity(0.05);
            Color boxDecorationColor = (!userData.darkmode)
                ? Colors.white
                : Color.fromRGBO(27, 27, 27, 1);
            Color buttonColor = Color.fromRGBO(255, 0, 0, 1);
            return new Scaffold(
              backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
              appBar: AppBar(
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: (!userData.darkmode)
                    ? Color.fromRGBO(255, 0, 0, 1)
                    : Color.fromRGBO(27, 27, 27, 0.4),
                toolbarHeight: 75,
                title: Icon(
                  Matjar.matjar_logo,
                  size: 70,
                ),
                actions: [
                  SizedBox(
                    width: 210,
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                currentIndex: currentIndex,
                backgroundColor:
                    (!userData.darkmode) ? Colors.white : Colors.black,
                selectedFontSize: 13,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.home,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.categories,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.cart,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.sign_in_and_sign_up_logo,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }
                    if (currentIndex == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    }
                    if (currentIndex == 2) {
                      if (user.uid == 'ING2u4fnlgQBpkUqrCoitD619iD3' ||
                          user == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      }
                    }
                    if (currentIndex == 3) {
                      if (user.uid == 'ING2u4fnlgQBpkUqrCoitD619iD3' ||
                          user == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileLoggedIn()));
                      }
                    }
                  });
                },
              ),
              body: new Container(
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                padding: new EdgeInsets.all(30),
                width: 380,
                decoration:
                    BoxDecoration(color: boxDecorationColor, boxShadow: [
                  BoxShadow(
                    color: (!userData.darkmode)
                        ? Colors.grey
                        : Color.fromRGBO(27, 27, 27, 1),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ]),
                child: new ListView(
                  children: [
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Padding(padding: EdgeInsets.all(15)),
                        new Text('Create Your Seller Account',
                            style: TextStyle(
                              fontSize: 23,
                              color: buttonColor,
                            )),
                        new Padding(padding: EdgeInsets.all(15)),
                        ////////////////////////////////////////////////////////////////////////////////error

                        new TextField(
                          controller: _firstNameController,
                          style: TextStyle(fontSize: 20, color: textColor),
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: textColor),
                              labelText: 'First Name',
                              border: InputBorder.none),
                        ),
                        new Padding(padding: EdgeInsets.all(10)),
                        new TextField(
                          style: TextStyle(fontSize: 20, color: textColor),
                          controller: _lastNameController,
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: textColor),
                              labelText: 'Last Name',
                              border: InputBorder.none),
                        ),
                        new Padding(padding: EdgeInsets.all(10)),
                        new TextField(
                          controller: _emailController,
                          style: TextStyle(fontSize: 20, color: textColor),
                          decoration: new InputDecoration(
                              labelStyle: TextStyle(color: textColor),
                              labelText: 'Email',
                              border: InputBorder.none),
                        ),
                        new Padding(padding: EdgeInsets.all(10)),
                        new TextField(
                          obscureText: true,
                          style: TextStyle(fontSize: 20, color: textColor),
                          controller: _passwordController,
                          decoration: new InputDecoration(
                            labelStyle: TextStyle(color: textColor),
                            labelText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 290.0,
                          height: 50,
                          child: ButtonTheme(
                            child: ElevatedButton(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () async {
                                if (_passwordController.text.length < 6) {
                                  setState(() {
                                    passError =
                                        "Password Must be bigger than 6 Characters";
                                  });
                                  return;
                                }
                                if (passError == "") {}

                                if (passError == "") {
                                  try {
                                    final UserRef = await FirebaseFirestore
                                        .instance
                                        .collection('Users')
                                        .get()
                                        .then((QuerySnapshot snapshot) {
                                      snapshot.docs
                                          .forEach((DocumentSnapshot doc) {
                                        x = doc.data()['email'].toString();

                                        if (x == _emailController.text) {
                                          notexist = false;
                                        }
                                        if (doc.id == "zzzzzzzzzz") {
                                          lastDoc = true;
                                        }
                                      });
                                    });
                                  } on FirebaseAuthException catch (e) {}

                                  if (lastDoc) {
                                    lastDoc = false;
                                    if (notexist) {
                                      dynamic result = await AuthService()
                                          .signupSeller(
                                              _emailController.text,
                                              _passwordController.text,
                                              _firstNameController.text.trim(),
                                              _lastNameController.text.trim())
                                          .then((user) {
                                        AuthService().login(
                                            _emailController.text.trim(),
                                            _passwordController.text.trim());
                                        Navigator.of(context)
                                            .pushNamed("/ProfileLoginSeller");
                                      });
                                    } else {
                                      setState(() {
                                        error =
                                            "  The email address is already in use by another account ";
                                      });
                                    }
                                    notexist = true;
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        buttonColor),
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Text(
                                'Already have an account?',
                                style:
                                    TextStyle(fontSize: 16, color: textColor),
                              ),
                              new FlatButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/LoginSeller');
                                },
                                child: new Text(
                                  'Log in',
                                  style:
                                      TextStyle(fontSize: 16, color: linkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: (error.length > 0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          error,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (passError.length > 0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          passError,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
