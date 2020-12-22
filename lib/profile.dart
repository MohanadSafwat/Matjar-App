import 'package:flutter/material.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 3;
  bool darkmodeVal = false;
  void switchButton(v) {
    setState(() {
      darkmodeVal = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            if (currentIndex == 0) {
              Navigator.of(context).pushNamed('/Home');
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 3, // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 55,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Login');
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Matjar.sign_in_and_sign_up_logo,
                              size: 40,
                              color: Color.fromRGBO(16, 24, 32, 1),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Source Sans Pro',
                                color: Color.fromRGBO(16, 24, 32, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/SignUp');
                        },
                        child: Column(
                          children: [
                            Icon(
                              Matjar1.signup,
                              size: 50,
                              color: Color.fromRGBO(16, 24, 32, 1),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Source Sans Pro',
                                color: Color.fromRGBO(16, 24, 32, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  children: [
                    Icon(
                      Matjar.help_outline,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro', fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  children: [
                    Icon(
                      Matjar.contact_us,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro', fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Matjar.dark_mode,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro', fontSize: 20),
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                    ),
                    Icon(
                      Matjar.twitter,
                      size: 40,
                    ),
                    Icon(
                      Matjar.instagram,
                      size: 33,
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
                      ),
                    ),
                    Text(
                      'Terms Of Sale',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 13,
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
                      ),
                    ),
                    Text(
                      'Return Policy',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/SignUpSeller");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Wanna be a seller?',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 13,
                            color: Color.fromRGBO(83, 169, 252, 1)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
