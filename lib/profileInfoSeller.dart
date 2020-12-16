import 'package:flutter/material.dart';
import 'matjar_icons.dart';
import 'Custom Widget/customComponents.dart';
import 'constants.dart';

class ProfileInfoSeller extends StatefulWidget {
  @override
  _ProfileInfoSellerState createState() => _ProfileInfoSellerState();
}

class _ProfileInfoSellerState extends State<ProfileInfoSeller> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Matjar.sign_in_and_sign_up_logo,
                  size: 28,
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
                      ),
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
                  style: TextStyle(fontSize: 17, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.16)),
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'Last Name',
                  style: TextStyle(fontSize: 17, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.16)),
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 17, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.16)),
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 17, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.16)),
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 17, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.16)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      text: 'Edit',
                      horizontal: 10.0,
                      vertical: 10.0,
                      fnc: () {}),
                  CustomButton(
                      text: 'Change Password',
                      horizontal: 10.0,
                      vertical: 10.0,
                      fnc: () {}),
                ],
              ),
            )
          ],
        ),
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
            title: Text(
              'Home',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.categories,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Categories',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.cart,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.sign_in_and_sign_up_logo,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
