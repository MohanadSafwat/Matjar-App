import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';

class ProfileLogInSeller extends StatefulWidget {
  @override
  _ProfileLogInSellerState createState() => _ProfileLogInSellerState();
}

class _ProfileLogInSellerState extends State<ProfileLogInSeller> {
  int currentIndex = 3;
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
        /* onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }, */
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
                    style:
                        TextStyle(fontFamily: 'Source Sans Pro', fontSize: 23),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Mohanad',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 25,
                      color: Color.fromRGBO(244, 52, 52, 1),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () => print("hi"),
                padding: EdgeInsets.zero,
                child: Container(
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
                        Matjar.sign_in_and_sign_up_logo,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
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
                      Matjar.dashboard,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'DashBoard',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro', fontSize: 20),
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
                      width: 90,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Matjar.toggle_off,
                        size: 20,
                      ),
                    ),
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
                    onPressed: () {},
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromRGBO(244, 52, 52, 1),
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
            ],
          ),
        ),
      ),
    );
  }
}
