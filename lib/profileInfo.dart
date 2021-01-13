import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'categories.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'modules/user.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);
    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userData = snapshot.data;
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
              backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
              appBar: AppBar(
                centerTitle: true,
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
                      Navigator.of(context).pushNamed('/Home');
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
                  });
                },
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Matjar.sign_in_and_sign_up_logo,
                          size: 28,
                          color: textColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 25,
                                  color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Source Sans Pro',
                              color: textColor),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(
                        userData.firstName.capitalize(),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Source Sans Pro',
                              color: textColor),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        userData.lastName.capitalize(),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Source Sans Pro',
                              color: textColor),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(
                        userData.email,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: boxDecorationColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              color: boxShadowColor),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Source Sans Pro',
                              color: textColor),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(
                        userData.address.capitalize(),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: boxDecorationColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              color: boxShadowColor),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Source Sans Pro',
                              color: textColor),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(
                        userData.contact.capitalize(),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: boxDecorationColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              color: boxShadowColor),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/ProfileEdit');
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.white,
                            ),
                          ),
                          color: buttonColor,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                      ],
                    )
                  ],
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
