import 'package:flutter/material.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';
import 'constants.dart';

var white = Colors.white;

class EmptyCart extends StatefulWidget {
  static String id = 'emptyCart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<EmptyCart> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      backgroundColor: Colors.white,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 370,
              child: Icon(
                Matjar.empty_cart,
                size: 370,
                color: mainColor,
              ),
            ),
            Container(
              width: 310.0,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 7,
                    blurRadius: 7,
                    //offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Your Cart is Empty or you are not logged in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}
