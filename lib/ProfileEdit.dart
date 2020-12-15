import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEdit> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: new Container(
          padding: new EdgeInsets.all(31),
          child: new ListView(
            children: [
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      new Text('Profile',
                          style: TextStyle(
                            fontSize: 21,
                          ))
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'First Name', border: OutlineInputBorder()),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'Last Name', border: OutlineInputBorder()),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'Address', border: OutlineInputBorder()),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'Contact', border: OutlineInputBorder()),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                        labelText: 'Currency', border: OutlineInputBorder()),
                  ),
                  new Container(
                    padding: new EdgeInsets.all(31),
                    child: new RaisedButton(
                      onPressed: null,
                      child: new Text('Save'),
                      color: Color.fromRGBO(255, 0, 0, 10),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
