import 'package:flutter/material.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';
import 'constants.dart';

var mainColor = Colors.red[700];
var white = Colors.white;
int currentIndex = 3;

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: white,
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
        body: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 100),
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                          fontSize: 25,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(lable: 'Old Password'),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(lable: 'New Password'),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(lable: 'Confirm Password'),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 310.0,
                      height: 50,
                      child: ButtonTheme(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Change",
                            style: TextStyle(
                              color: white,
                              fontSize: 25,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
