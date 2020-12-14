import 'package:flutter/material.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';

var mainColor = Colors.red[700];
var white = Colors.white;
int currentIndex = 3;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomAppBar(),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cart2.png'),
              ),
            ),
          ),
          Container(
            width: 310.0,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ButtonTheme(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Your Cart is Empty",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 25,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
