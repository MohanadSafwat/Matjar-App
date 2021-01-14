//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/actions/constants.dart';
import 'package:matjar_login_signup/login.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/cartItem.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'package:matjar_login_signup/payment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'Cart.dart';
import 'actions/productService.dart';
import 'categories.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';

import 'Custom Widget/customComponents.dart';
import 'home.dart';
import 'matjar_icons.dart';

class SelectedItem extends StatefulWidget {
  static String id = 'selected_item';

  @override
  _SelectedItem createState() => _SelectedItem();
}

class _SelectedItem extends State<SelectedItem> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id;
    int currentIndex = 0;
    getUserId();
    id = sendID();
    Item item = ModalRoute.of(context).settings.arguments;
    print(id);
    double reviewRate;
    TextEditingController reviewComment = TextEditingController();
    //print(item.categoryName);
    final user = Provider.of<Userinit>(context);

    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('user.uid = ${user.uid}');
            // print('id = $id');
            Account userData = snapshot.data;
            Color textColor =
                (!userData.darkmode) ? Colors.black : Colors.white;
            Color boxShadowColor = (!userData.darkmode)
                ? Colors.grey.withOpacity(0.16)
                : Colors.white.withOpacity(0.05);
            Color boxDecorationColor = (!userData.darkmode)
                ? Colors.white
                : Color.fromRGBO(27, 27, 27, 1);
            Color buttonColor = Color.fromRGBO(255, 0, 0, 1);
            Color appBarColor = (!userData.darkmode)
                ? Color.fromRGBO(255, 0, 0, 1)
                : Color.fromRGBO(27, 27, 27, 0.4);
            Color linkColor = (!userData.darkmode)
                ? Color.fromRGBO(83, 169, 252, 1)
                : Color.fromRGBO(83, 169, 252, 1);
            return Scaffold(
              backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                titleSpacing: 0,
                backgroundColor: (!userData.darkmode)
                    ? Color.fromRGBO(255, 0, 0, 1)
                    : Color.fromRGBO(27, 27, 27, 0.4),
                toolbarHeight: 75,
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
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                currentIndex: currentIndex,
                backgroundColor:
                    (!userData.darkmode) ? Colors.white : Colors.black,
                selectedFontSize: 13,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.home,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.categories,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.cart,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.sign_in_and_sign_up_logo,
                      color: (!userData.darkmode) ? Colors.red : Colors.white,
                    ),
                    label: "",
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }
                    if (currentIndex == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    }
                    if (currentIndex == 2) {
                      if (user.uid == 'gHCkBQhbQ2YA5L631wDangP0FsJ2' ||
                          user == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      }
                    }
                    if (currentIndex == 3) {
                      if (user.uid == 'gHCkBQhbQ2YA5L631wDangP0FsJ2' ||
                          user == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileLoggedIn()));
                      }
                    }
                  });
                },
              ),
              body: StreamBuilder<DocumentSnapshot>(
                  stream: Product(item.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(item.url),
                                height: 215,
                                width: 321,
                                margin: EdgeInsets.only(
                                    top: 18, left: 27, right: 26),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 1,
                                      ),
                                    ]),
                              ),
                              Container(
                                height: 122,
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    top: 18, left: 27, right: 26),
                                //color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 12),
                                            child: Text(
                                              item.brand,
                                              style: TextStyle(
                                                  color: Colors.blue
                                                      .withOpacity(1),
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 12),
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.yellow,
                                                width: 35,
                                                height: 19,
                                                child: Center(
                                                  child: Text(
                                                    (() {
                                                      if (snapshot.data
                                                              .data()['rate'] ==
                                                          0) {
                                                        return "N/A";
                                                      } else {
                                                        return "${snapshot.data.data()['rate'].toStringAsFixed(1)}";
                                                      }
                                                    })(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  (() {
                                                    if (snapshot.data.data()[
                                                            'itemReviews'] ==
                                                        null) {
                                                      return "( 0 reviews )";
                                                    } else {
                                                      return "( ${snapshot.data.data()['itemReviews'].length} reviews )";
                                                    }
                                                  })(),
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: textColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 12),
                                            child: Row(
                                              children: [
                                                Text("Egp ",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                    )),
                                                Text(
                                                    "${item.price.toInt().toString()}",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      height: 25,
                                      width: 100,
                                      child: Container(
                                        color: Colors.blue,
                                        child: Builder(
                                          builder: (context) => RaisedButton(
                                            onPressed: () {
                                              if (user.uid ==
                                                  'gHCkBQhbQ2YA5L631wDangP0FsJ2') {
                                                Navigator.of(context)
                                                    .pushNamed('/Login');
                                              } else {
                                                addProductToCart(
                                                    item,
                                                    user.uid,
                                                    snapshot.data.data()[
                                                        'noOfItemsInStock']);
                                                Navigator.of(context).pushNamed(
                                                    Cart.id,
                                                    arguments: item);
                                              }
                                            },
                                            child: Text('Add to Cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12)),
                                            color: linkColor,
                                          ),
                                        ),
                                      ),
                                      bottom: 5,
                                      right: 18,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 215,
                                  width: 321,
                                  margin: EdgeInsets.only(
                                      top: 18, left: 27, right: 26),
                                  decoration: BoxDecoration(
                                      color: boxDecorationColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(1),
                                          blurRadius: 1,
                                        ),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Specs',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: textColor),
                                        ),
                                        margin: EdgeInsets.only(
                                          left: 13,
                                          top: 13,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Text(
                                                  item.specs.keys
                                                      .elementAt(0)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100.0),
                                              child: Text(
                                                  item.specs.values
                                                      .elementAt(0)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Text(
                                                  item.specs.keys
                                                      .elementAt(1)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100.0),
                                              child: Text(
                                                  item.specs.values
                                                      .elementAt(1)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(


                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Text(
                                                  item.specs.keys
                                                      .elementAt(2)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100.0),
                                              child: Text(
                                                  item.specs.values
                                                      .elementAt(2)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Text(
                                                  item.specs.keys
                                                      .elementAt(3)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100.0),
                                              child: Text(
                                                  item.specs.values
                                                      .elementAt(3)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Visibility(
                                visible: ((() {
                                  if (snapshot.data
                                          .data()['itemReviews']
                                          .length ==
                                      0) {
                                    return false;
                                  } else {
                                    /* print(snapshot.data
                                        .data()['itemReviews']
                                        .length); */
                                    return true;
                                  }
                                })()),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 18, left: 27, right: 26),
                                  decoration: BoxDecoration(
                                      color: boxDecorationColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: boxShadowColor,
                                          blurRadius: 1,
                                        ),
                                      ]),
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Reviews',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: textColor
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ListView.builder(
                                        itemCount: (snapshot.data
                                                    .data()['itemReviews'] ==
                                                null)
                                            ? 0
                                            : snapshot.data
                                                .data()['itemReviews']
                                                .length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            color: boxDecorationColor,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                "${snapshot.data.data()['itemReviews'][index]['firstName'].toString()} ${snapshot.data.data()['itemReviews'][index]['lastName'].toString()}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                            ),
                                                            RatingBar.builder(
                                                              initialRating: snapshot
                                                                  .data
                                                                  .data()[
                                                                      'itemReviews']
                                                                      [index][
                                                                      'noOfStars']
                                                                  .toDouble(),
                                                              minRating: 1,
                                                              itemSize: 15,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              itemPadding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          1.0),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              onRatingUpdate:
                                                                  null,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(snapshot
                                                                          .data
                                                                          .data()[
                                                                      'itemReviews']
                                                                  [
                                                                  index]['comment'],
                                                                style:TextStyle(color:textColor)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                child: Container(

                                  margin: EdgeInsets.only(
                                      top: 18, left: 27, right: 26),
                                  padding: EdgeInsets.only(
                                      top: 18, left: 27, right: 26),
                                  decoration: BoxDecoration(
                                    color: boxDecorationColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Add Review',
                                            style: TextStyle(
                                              color: textColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    style:
                                                    TextStyle( color: textColor),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Add your Review',
                                                    hintStyle: TextStyle(color: textColor)),

                                                    controller: reviewComment,
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 1,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 15,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    reviewRate = rating;
                                                    //print(rating);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 180,
                                                ),
                                                FlatButton(
                                                  onPressed: () async {
                                                    double newRate = updateRate(
                                                        snapshot.data
                                                            .data()[
                                                                'itemReviews']
                                                            .length,
                                                        double.parse(snapshot
                                                            .data
                                                            .data()['rate']
                                                            .toString()),
                                                        reviewRate);
                                                    //print(newRate);
                                                    await addReviewToCategories(
                                                        {
                                                          'firstName': userData
                                                              .firstName,
                                                          'lastName':
                                                              userData.lastName
                                                        },
                                                        item.id,
                                                        reviewComment.text,
                                                        reviewRate,
                                                        item.categoryName);
                                                    await upateRateOnCategories(
                                                        newRate,
                                                        item.id,
                                                        item.categoryName);
                                                  },
                                                  color: buttonColor,
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                visible: ((() {
                                  if (id == 'gHCkBQhbQ2YA5L631wDangP0FsJ2' || user.uid == null) {
                                    return false;
                                  } else
                                    return true;
                                })()),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            );
          } else
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainColor,
                ),
              ),
            );
        });
  }

  void addToCart(context, item) {
    cartItem cartitem = Provider.of<cartItem>(context, listen: false);
    // item.itemQuantity=_quantity;
    var itemsInCart = cartitem.items;
    bool exist = false;
    for (var itemsInCart in itemsInCart) {
      if (itemsInCart == item) {
        exist = true;
      }
    }

    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Already Added to Cart'),
      ));
    } else {
      cartitem.addItem(item);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
      ));
    }
  }
}

double updateRate(int noOfRev, double oldRate, double newRate) {
  return (oldRate * noOfRev + newRate) / (noOfRev + 1);
}
