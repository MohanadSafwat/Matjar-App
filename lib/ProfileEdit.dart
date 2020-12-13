import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProfileEditState();
  }
 }
class _ProfileEditState extends State<ProfileEdit>{
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
        padding: new EdgeInsets.all(31),
        child:new ListView(
          children: [
             new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Row(
              children: [
                Icon(Icons.person , size: 30,) ,
            new Text('Profile' ,style: TextStyle(
          fontSize: 21,
            )
            ) 
              ],
            ),
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
               controller: null,
              decoration: new InputDecoration(
                labelText:'First Name',border:OutlineInputBorder()
              ),
            ),   
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
               controller: null,
              decoration: new InputDecoration(
                labelText:'Last Name',border:OutlineInputBorder()),
            ),
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
               controller: null,
              decoration: new InputDecoration(
                labelText:'Email',border:OutlineInputBorder()),
            ),
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
               controller: null,
              decoration: new InputDecoration(
                labelText:'Address',border:OutlineInputBorder()),
            ),
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
               controller: null,
              decoration: new InputDecoration(
                labelText:'Contact',border:OutlineInputBorder()),
            ),
            new Padding(padding: EdgeInsets.all(5)),
            new TextField(
              controller: null,
              decoration: new InputDecoration(
                labelText:'Currency',border:OutlineInputBorder()),
            ),
           new Container(
             padding: new EdgeInsets.all(31),
             child:new RaisedButton(
             onPressed: null,
             child: new Text('Save'),
             color: Color.fromRGBO(255, 0, 0, 10 ),
             ) ,
             ),
          ],
      ),

          ],
        )
        
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