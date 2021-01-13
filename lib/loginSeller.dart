import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'categories.dart';
import 'firebase/userDatabase.dart';
import 'home.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'auth/auth.dart';
import 'modules/user.dart';
//import 'package:matjar_login_signup/Classes/auth.dart';

var white = Colors.white;

final Future<FirebaseApp> _init = Firebase.initializeApp();

class LoginSeller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginSellerState();
  }
}

class LoginSellerState extends State<LoginSeller> {
  int currentIndex = 3;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var x, y;
  String uid, error = "";
  bool exist = false;
  bool lastDoc = false;
  FirebaseAuth fAuth;

  FirebaseFirestore fStore;

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
                      EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
                  //height: 700,
                  width: 700,
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
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Login with seller account",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: buttonColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  error,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: buttonColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                ),
                              ),
                            ),
                            Container(
                              color: boxDecorationColor,
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                                controller: _emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your Email",
                                    hintStyle: TextStyle(color: Colors.grey)),
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
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: linkColor),
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
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                        onPressed: () async {
                                          try {
                                            final UserRef = await Firestore
                                                .instance
                                                .collection('Users')
                                                // ignore: deprecated_member_use
                                                .getDocuments()
                                                .then((QuerySnapshot snapshot) {
                                              // ignore: deprecated_member_use
                                              snapshot.documents.forEach(
                                                  (DocumentSnapshot doc) {
                                                x = doc
                                                    .data()['email']
                                                    .toString();

                                                if (x ==
                                                    _emailController.text) {
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
                                              dynamic result =
                                                  await AuthService().login(
                                                      _emailController.text,
                                                      _passwordController.text);

                                              final checkUser =
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('Users')
                                                      .doc(result.uid)
                                                      .get()
                                                      .then((snapshot) {
                                                var check =
                                                    snapshot.data()['isSeller'];

                                                if (check) {
                                                  Navigator.of(context)
                                                      .pushNamed('/ProfileLoginSeller');
                                                } else {
                                                  setState(() {
                                                    error =
                                                        " *This is a buyer account please press: Login as user?";
                                                  });
                                                }
                                              });
                                            } else {
                                              setState(() {
                                                error =
                                                    " invalid email or password ";
                                              });
                                            }
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  buttonColor),
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
                                    "Don't have a seller account?",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextButton(
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(color: linkColor),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('/SignUpSeller'),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: TextButton(
                                child: Text(
                                  "Login as user?",
                                  style: TextStyle(color: linkColor),
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pushNamed('/Login'),
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
