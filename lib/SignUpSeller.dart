import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';

class SignUpSeller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpSeller();
  }
}

class _SignUpSeller extends State<SignUpSeller> {
    int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: new Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        padding: new EdgeInsets.all(30),
        width: 380,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]),
        child: new ListView(
          children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Padding(padding: EdgeInsets.all(10)),
                new Text('Create Your Seller Account',
                    style: TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 0, 0, 10 ),
                    )),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: null,
                  decoration: new InputDecoration(labelText: 'First Name',border:OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: null,
                  decoration: new InputDecoration(labelText: 'Last Name',border:OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: null,
                  decoration: new InputDecoration(labelText: 'Email',border:OutlineInputBorder()),
                ),
                new Padding(padding: EdgeInsets.all(10)),
                new TextField(
                  controller: null,
                  decoration: new InputDecoration(labelText: 'Password' ,border:OutlineInputBorder()),
                ),
                new Container(
                  padding: new EdgeInsets.all(31),
                  width: 300,
                  child: new RaisedButton(
                    onPressed: () {print('hi');} ,
                    child: new Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 21),
                    ),
                    color: Colors.red[600],
                  ),
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      new FlatButton(
                        onPressed: null,
                        child: new Text('Log in', ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 13,
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
