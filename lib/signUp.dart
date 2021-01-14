import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/firebase/userDatabase.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'auth/auth.dart';
import 'categories.dart';
import 'home.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'firebase/userDatabase.dart';
import 'modules/user.dart';

var mainColor = Colors.red[700];
var white = Colors.white;
var x, y;
bool lastDoc = false;
String uid, error = "", passError = "";
bool notexist = true;

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  int currentIndex = 3;
  String err = "";
  /* Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((userCredential) {
        //User updateUser = FirebaseAuth.instance.currentUser;
        DatabaseService()
            .userSetup(_firstNameController.text, _lastNameController.text);
        Navigator.of(context).pushNamed('/Login');
      });
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  } */

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
            return Scaffold(
                resizeToAvoidBottomPadding: false,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
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
                body: Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: boxDecorationColor,
                    boxShadow: [
                      BoxShadow(
                        color: (!userData.darkmode)
                            ? Colors.grey
                            : Color.fromRGBO(27, 27, 27, 1),
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                        blurRadius: 5, // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Create a new account",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: buttonColor,
                                  ),
                                ),
                              ),
                            ),
///////////////////////////////////////////error

                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                                controller: _firstNameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "First Name",
                                  labelStyle: TextStyle(color: textColor),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(color: textColor),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: textColor),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: textColor),
                                ),
                                obscureText: true,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(color: textColor),
                                ),
                                obscureText: true,
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
                                      color: white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_passwordController.text !=
                                        _confirmPasswordController.text) {
                                      setState(() {
                                        err = '*Unmatched passwords';
                                      });
                                    }
                                    if (_passwordController.text.length < 6) {
                                      setState(() {
                                        passError =
                                            "Password Must be greater than or equal 6 Characters";
                                      });
                                      return;
                                    }
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
                                              .signup(
                                                  _emailController.text,
                                                  _passwordController.text,
                                                  _firstNameController.text
                                                      .trim(),
                                                  _lastNameController.text
                                                      .trim())  .then((r) async {
                                            await AuthService().login(
                                              _emailController.text,
                                              _passwordController.text,
                                            );
                                          },);
                                          Navigator.of(context)
                                              .pushNamed('/Home');
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
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: TextButton(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: linkColor),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('/Login'),
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

                            /* Padding(
                          padding: EdgeInsets.all(5),
                        ), */
                            Visibility(
                              visible: (err.length > 0),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "$err",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
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
