import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'Cart.dart';
import 'actions/productActions.dart';
import 'categories.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';

class ProfileLoggedIn extends StatefulWidget {
  @override
  _ProfileLoggedInState createState() => _ProfileLoggedInState();
}

class _ProfileLoggedInState extends State<ProfileLoggedIn> {
  int currentIndex = 3;

  bool darkmodeVal = false;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);

    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userData = snapshot.data;
            bool darkmodeVal = userData.darkmode;
            void switchButton(v) {
              setState(() {
                darkmodeVal = v;
                darkModeToggle(userData.uid,darkmodeVal);
              });
            }
            Color textColor = (!userData.darkmode)
                ? Colors.black
                : Colors.white ;

            return StreamBuilder<Account>(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {

                return Scaffold(
                  backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
                  appBar: AppBar(
                    toolbarHeight: 75,
                    titleSpacing: 0,
                    backgroundColor: (!userData.darkmode)
                        ? Color.fromRGBO(255, 0, 0, 1)
                        : Color.fromRGBO(27, 27, 27, 1),
                    // toolbarHeight: 75,

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
                    backgroundColor:  (!userData.darkmode) ? Colors.white : Colors.black,
                    selectedFontSize: 13,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Matjar.home,
                          color: (!userData.darkmode)
                              ? Colors.red
                              : Colors.white,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Matjar.categories,
                          color: (!userData.darkmode)
                              ? Colors.red
                              : Colors.white,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Matjar.cart,
                          color: (!userData.darkmode)
                              ? Colors.red
                              : Colors.white,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Matjar.sign_in_and_sign_up_logo,
                          color:(!userData.darkmode)
                              ? Colors.red
                              : Colors.white,
                        ),
                        label: "",
                      ),
                    ],
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                        if (currentIndex == 0) {
                          Navigator.of(context).pushNamed('/Home');
                        }
                        if (currentIndex == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Categories()));
                        }
                        if (currentIndex == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart()));
                        }
                      });
                    },
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    fontFamily: 'Source Sans Pro', fontSize: 23,
                                color:  (!userData.darkmode)
                                    ? Colors.black
                                    : Colors.white,),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '${userData.firstName.capitalize()} ${userData.lastName.capitalize()}',
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 25,
                                  color: Color.fromRGBO(244, 52, 52, 1),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/ProfileInfo');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: (!userData.darkmode) ?   Colors.white
                                    : Color.fromRGBO(27, 27, 27, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: (!userData.darkmode) ?  Colors.grey.withOpacity(0.16)
                                        :  Colors.white.withOpacity(0.16),
                                    offset: Offset(0, 3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Matjar.sign_in_and_sign_up_logo,
                                    size: 20,
                                    color: (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 20,
                                      color: (!userData.darkmode)
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode) ?   Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode) ?  Colors.grey.withOpacity(0.16)
                                      :  Colors.white.withOpacity(0.16),
                                  offset: Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Matjar.help_outline,
                                  size: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Help',
                                  style: TextStyle(
                                      fontFamily: 'Source Sans Pro', fontSize: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white,),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:(!userData.darkmode) ?   Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode) ?  Colors.grey.withOpacity(0.16)
                                      :  Colors.white.withOpacity(0.16),
                                  offset: Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Matjar.contact_us,
                                  size: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontFamily: 'Source Sans Pro', fontSize: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 33,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode) ?   Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode) ?  Colors.grey.withOpacity(0.16)
                                      :  Colors.white.withOpacity(0.16),
                                  offset: Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Matjar.dark_mode,
                                  size: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Dark Mode',
                                  style: TextStyle(
                                      fontFamily: 'Source Sans Pro', fontSize: 20,
                                  color: (!userData.darkmode)
                                      ? Colors.black
                                      : Colors.white,),
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                /* FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Matjar.toggle_off,
                                    size: 20,
                                  ),
                                ), */
                                Switch(
                                  value: darkmodeVal,
                                  onChanged: switchButton,
                                  activeColor: Colors.white,

                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(

                                onPressed: () async {
                                  await AuthService().signOut();
                                  Navigator.of(context).pushNamed('/');
                                },

                                child: Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Source Sans Pro',
                                    color: Colors.white,
                                  ),
                                ),
                                color: Color.fromRGBO(255, 0, 0, 1),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 110),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Matjar.facebook,
                                  size: 30,
                                  color:  (!userData.darkmode)
                                      ? Colors.black
                                      : Color.fromRGBO(255, 0, 0, 1),
                                ),
                                Icon(
                                  Matjar.twitter,
                                  size: 40,
                                  color:  (!userData.darkmode)
                                      ? Colors.black
                                      : Color.fromRGBO(255, 0, 0, 1),
                                ),
                                Icon(
                                  Matjar.instagram,
                                  size: 33,
                                  color:  (!userData.darkmode)
                                      ? Colors.black
                                      : Color.fromRGBO(255, 0, 0, 1),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 62),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Terms Of Use',
                                  style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 13,
                                    color:  (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'Terms Of Sale',
                                  style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 13,
                                    color:  (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 13,
                                    color:  (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 90),
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Warranty Policy',
                                  style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 13,
                                      color:  (!userData.darkmode)
                                          ? Colors.black
                                          : Colors.white,
                                  ),
                                ),
                                Text(
                                  'Return Policy',
                                  style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 13,
                                    color:  (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
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
