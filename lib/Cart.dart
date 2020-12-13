import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';

class Cart extends StatelessWidget {
  static String id = 'Cart';
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
      body: new ListView(
        children: [
          new Container(
            margin: EdgeInsets.all(30),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Container(
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Container(
                        child: new Icon(
                          Icons.face,
                          size: 100,
                        ),
                      ),
                      new Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            new Row(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 5)),
                                new Text(
                                  'product name',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Text(
                                  'Total price  ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            new Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 40)),
                                new Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: new Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new FlatButton(
                                    onPressed: null,
                                    child: new Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.red[600]),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Container(
                        child: new Icon(
                          Icons.face,
                          size: 100,
                        ),
                      ),
                      new Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            new Row(
                              children: [
                                Padding(padding: EdgeInsets.only(right: 5)),
                                new Text(
                                  'product name',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Text(
                                  'Total price  ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            new Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 40)),
                                new Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: new Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new FlatButton(
                                    onPressed: null,
                                    child: new Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.red[600]),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 30)),
                new Container(
                  child: new Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text('Total price',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[600])),
                          new Text(
                            'EGP 6,000',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          new Container(
                            padding: new EdgeInsets.all(31),
                            child: new RaisedButton(
                              onPressed: null,
                              child: new Text('Purches now',
                                  style: TextStyle(fontSize: 18)),
                              color: Color.fromRGBO(255, 0, 0, 10),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
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

      ),
    );
  }
}
