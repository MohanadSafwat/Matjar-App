import 'package:flutter/material.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'Cart.dart';
import 'ProfileLoginSeller.dart';
import 'categories.dart';
import 'home.dart';
import 'login.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';
import 'modules/user.dart';

class ProfileEditSeller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProfileEditSellerState();
  }
}

class _ProfileEditSellerState extends State<ProfileEditSeller> {
  int currentIndex = 3;

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
            TextEditingController firstNameController =
                TextEditingController(text: userData.firstName);
            TextEditingController lastNameController =
                TextEditingController(text: userData.lastName);
            TextEditingController addressController =
                TextEditingController(text: userData.address);
            TextEditingController contactController =
                TextEditingController(text: userData.contact);
            TextEditingController currencyController =
                TextEditingController(text: userData.currency);
            return new Scaffold(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileLogInSeller()));
                      }
                    }
                  });
                },
              ),
              body: new Container(
                  padding: new EdgeInsets.all(31),
                  child: new ListView(
                    children: [
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: new Row(
                              children: [
                                Icon(
                                  Matjar.sign_in_and_sign_up_logo,
                                  size: 30,
                                  color: textColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                new Text('Profile',
                                    style: TextStyle(
                                        fontSize: 21, color: textColor))
                              ],
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: boxDecorationColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: boxShadowColor,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                //initialValue: userData.firstName,
                                controller: firstNameController,
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                                decoration: new InputDecoration(
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: textColor),
                                    labelText: 'First Name',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(10)),
                          Container(
                            decoration: BoxDecoration(
                              color: boxDecorationColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: boxShadowColor,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                //initialValue: userData.lastName,
                                controller: lastNameController,
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                                decoration: new InputDecoration(
                                    labelStyle: TextStyle(color: textColor),
                                    labelText: 'Last Name',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(10)),
                          Container(
                            decoration: BoxDecoration(
                              color: boxDecorationColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: boxShadowColor,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                  //initialValue: userData.address,
                                  style:
                                      TextStyle(fontSize: 20, color: textColor),
                                  controller: addressController,
                                  decoration: new InputDecoration(
                                      labelStyle: TextStyle(color: textColor),
                                      labelText: 'Address',
                                      border: InputBorder.none)),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(10)),
                          Container(
                            decoration: BoxDecoration(
                              color: boxDecorationColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: boxShadowColor,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                //initialValue: userData.contact,
                                controller: contactController,
                                style:
                                    TextStyle(fontSize: 20, color: textColor),
                                decoration: new InputDecoration(
                                  labelStyle: TextStyle(color: textColor),
                                  labelText: 'Contact',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(10)),
                          Container(
                            decoration: BoxDecoration(
                              color: boxDecorationColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: boxShadowColor,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                  //initialValue: userData.currency,
                                  controller: currencyController,
                                  style:
                                      TextStyle(fontSize: 20, color: textColor),
                                  decoration: new InputDecoration(
                                      labelText: 'Currency',
                                      labelStyle: TextStyle(
                                          fontSize: 12, color: textColor),
                                      border: InputBorder.none)),
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.all(31),
                            child: new RaisedButton(
                              onPressed: () async {
                                await DatabaseService(uid: user.uid).userEdit(
                                    firstNameController.text,
                                    lastNameController.text,
                                    addressController.text,
                                    contactController.text,
                                    currencyController.text);
                                Navigator.of(context).pushNamed("/ProfileInfo");
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Source Sans Pro',
                                  color: Colors.white,
                                ),
                              ),
                              color: Color.fromRGBO(255, 0, 0, 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainColor,
                ),
              ),
            );
          }
        });
  }
}
