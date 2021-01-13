import 'package:flutter/material.dart';
import 'package:matjar_login_signup/firebase/userDatabase.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'package:provider/provider.dart';
import 'actions/productActions.dart';
import 'auth/auth.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';

class ProfileLogInSeller extends StatefulWidget {
  @override
  _ProfileLogInSellerState createState() => _ProfileLogInSellerState();
}

class _ProfileLogInSellerState extends State<ProfileLogInSeller> {
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
                darkModeToggle(userData.uid, darkmodeVal);
              });
            }

            Color textColor =
                (!userData.darkmode) ? Colors.black : Colors.white;
            return Scaffold(
              backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
              appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                toolbarHeight: 75,
                titleSpacing: 0,
                backgroundColor: (!userData.darkmode)
                    ? Color.fromRGBO(255, 0, 0, 1)
                    : Color.fromRGBO(27, 27, 27, 0.4),
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
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 23,
                              color: (!userData.darkmode)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            '${userData.firstName.capitalize()} ${userData.lastName.capitalize()}',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 25,
                              color: Color.fromRGBO(255, 0, 0, 1),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed('/ProfileInfoSeller'),
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (!userData.darkmode)
                                ? Colors.white
                                : Color.fromRGBO(27, 27, 27, 1),
                            boxShadow: [
                              BoxShadow(
                                color: (!userData.darkmode)
                                    ? Colors.grey.withOpacity(0.16)
                                    : Colors.white.withOpacity(0.16),
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 5,
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
                      FlatButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/SellerDashboard'),
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (!userData.darkmode)
                                ? Colors.white
                                : Color.fromRGBO(27, 27, 27, 1),
                            boxShadow: [
                              BoxShadow(
                                color: (!userData.darkmode)
                                    ? Colors.grey.withOpacity(0.16)
                                    : Colors.white.withOpacity(0.16),
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.dashboard,
                                size: 20,
                                color: (!userData.darkmode)
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Dashboard',
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
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: (!userData.darkmode)
                              ? Colors.white
                              : Color.fromRGBO(27, 27, 27, 1),
                          boxShadow: [
                            BoxShadow(
                              color: (!userData.darkmode)
                                  ? Colors.grey.withOpacity(0.16)
                                  : Colors.white.withOpacity(0.16),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: (!userData.darkmode)
                              ? Colors.white
                              : Color.fromRGBO(27, 27, 27, 1),
                          boxShadow: [
                            BoxShadow(
                              color: (!userData.darkmode)
                                  ? Colors.grey.withOpacity(0.16)
                                  : Colors.white.withOpacity(0.16),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
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
                      SizedBox(
                        height: 33,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: (!userData.darkmode)
                              ? Colors.white
                              : Color.fromRGBO(27, 27, 27, 1),
                          boxShadow: [
                            BoxShadow(
                              color: (!userData.darkmode)
                                  ? Colors.grey.withOpacity(0.16)
                                  : Colors.white.withOpacity(0.16),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
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
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20,
                                color: (!userData.darkmode)
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                            ),
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
                              color: (!userData.darkmode)
                                  ? Colors.black
                                  : Color.fromRGBO(255, 0, 0, 1),
                            ),
                            Icon(
                              Matjar.twitter,
                              size: 40,
                              color: (!userData.darkmode)
                                  ? Colors.black
                                  : Color.fromRGBO(255, 0, 0, 1),
                            ),
                            Icon(
                              Matjar.instagram,
                              size: 33,
                              color: (!userData.darkmode)
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
                                  color: textColor),
                            ),
                            Text(
                              'Terms Of Sale',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 13,
                                  color: textColor),
                            ),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 13,
                                  color: textColor),
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
                                  color: textColor),
                            ),
                            Text(
                              'Return Policy',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 13,
                                  color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
