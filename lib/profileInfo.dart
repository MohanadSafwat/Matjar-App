import 'package:flutter/material.dart';
import 'matjar_icons1.dart';

import 'matjar_icons.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        toolbarHeight: 75,
        leading: FlatButton(
          onPressed: () {},
          child: Icon(
            Matjar.keyboard_arrow_left,
            size: 35,
            color: Colors.white,
          ),
        ),
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
        child: Column(
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
            Row(
              children:[ Padding(
                padding: const EdgeInsets.only(left:25.0,top:15),
                child: Text('First Name',style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Source Sans Pro'
                ),),
              ),]
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, ),
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
            Row(
                children:[ Padding(
                  padding: const EdgeInsets.only(left:25.0,top:10),
                  child: Text('Last Name',style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Source Sans Pro'
                  ),),
                ),]
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, ),
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
            Row(
                children:[ Padding(
                  padding: const EdgeInsets.only(left:25.0,top:10),
                  child: Text('Email',style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Source Sans Pro'
                  ),),
                ),]
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,),
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
            Row(
                children:[ Padding(
                  padding: const EdgeInsets.only(left:25.0,top:10),
                  child: Text('Address',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Source Sans Pro'
                  ),),
                ),]
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, ),
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
            Row(
                children:[ Padding(
                  padding: const EdgeInsets.only(left:25.0,top:10),
                  child: Text('Contact',style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Source Sans Pro'
                  ),),
                ),]
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, ),
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
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 10,),

                FlatButton(onPressed: (){}, child: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Source Sans Pro',
                    color: Colors.white,
                  ),
                ),
                  color: Color.fromRGBO(244, 52, 52, 1),
                ),
                SizedBox(width: 70,),

                FlatButton(onPressed: (){}, child: Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white,
                  ),
                ),
                  color: Color.fromRGBO(244, 52, 52, 1),
                ),
              ],
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
