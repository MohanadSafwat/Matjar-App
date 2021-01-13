//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/actions/constants.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/cartItem.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'package:provider/provider.dart';
import 'package:matjar_login_signup/payment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'Cart.dart';
import 'actions/productService.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';

import 'Custom Widget/customComponents.dart';

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
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 60,
                backgroundColor: Colors.red,
                title: Text(
                  'Matjar',
                  style: TextStyle(
                    fontFamily: "DancingScript",
                  ),
                ),
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
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  fontSize: 11),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.yellow,
                                                width: 28,
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
                                                    fontSize: 11,
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
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 12),
                                            child: Text(
                                                "Egp ${item.price.toInt().toString()}"),
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
                                                  'ING2u4fnlgQBpkUqrCoitD619iD3') {
                                                Navigator.of(context)
                                                    .pushNamed('/Login');
                                              } else {
                                                addProductToCart(
                                                    item, user.uid);
                                                Navigator.of(context).pushNamed(
                                                    Cart.id,
                                                    arguments: item);
                                              }
                                            },
                                            child: Text('Add to Cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12)),
                                            color: Colors.blue,
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
                                      color: Colors.white,
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
                                              fontSize: 15),
                                        ),
                                        margin: EdgeInsets.only(
                                          left: 13,
                                          top: 13,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(item.specs.keys
                                                  .elementAt(0)
                                                  .toString()),
                                              margin: EdgeInsets.only(
                                                left: 13,
                                                top: 10,
                                              ),
                                              height: 25,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(1),
                                                      blurRadius: 10,
                                                    ),
                                                  ])),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(item.specs.values
                                                .elementAt(0)
                                                .toString()),
                                            margin: EdgeInsets.only(
                                              left: 13,
                                              top: 10,
                                            ),
                                            height: 25,
                                            width: 165,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(1),
                                                    blurRadius: 10,
                                                  ),
                                                ]),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(item.specs.keys
                                                  .elementAt(1)
                                                  .toString()),
                                              margin: EdgeInsets.only(
                                                left: 13,
                                                top: 10,
                                              ),
                                              height: 25,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(1),
                                                      blurRadius: 10,
                                                    ),
                                                  ])),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(item.specs.values
                                                .elementAt(1)
                                                .toString()),
                                            margin: EdgeInsets.only(
                                              left: 13,
                                              top: 10,
                                            ),
                                            height: 25,
                                            width: 165,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(1),
                                                    blurRadius: 10,
                                                  ),
                                                ]),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(item.specs.keys
                                                  .elementAt(2)
                                                  .toString()),
                                              margin: EdgeInsets.only(
                                                left: 13,
                                                top: 10,
                                              ),
                                              height: 25,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(1),
                                                      blurRadius: 10,
                                                    ),
                                                  ])),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(item.specs.values
                                                .elementAt(2)
                                                .toString()),
                                            margin: EdgeInsets.only(
                                              left: 13,
                                              top: 10,
                                            ),
                                            height: 25,
                                            width: 165,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(1),
                                                    blurRadius: 10,
                                                  ),
                                                ]),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(item.specs.keys
                                                  .elementAt(3)
                                                  .toString()),
                                              margin: EdgeInsets.only(
                                                left: 13,
                                                top: 10,
                                              ),
                                              height: 25,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(1),
                                                      blurRadius: 10,
                                                    ),
                                                  ])),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(item.specs.values
                                                .elementAt(3)
                                                .toString()),
                                            margin: EdgeInsets.only(
                                              left: 13,
                                              top: 10,
                                            ),
                                            height: 25,
                                            width: 165,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(1),
                                                    blurRadius: 10,
                                                  ),
                                                ]),
                                          )
                                        ],
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
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(1),
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
                                                                  index]['comment']),
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
                                    color: Colors.white,
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
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Add your Review'),
                                                    controller: reviewComment,
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 5,
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
                                                  color: Colors.red,
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
                                  if (id == 'ING2u4fnlgQBpkUqrCoitD619iD3') {
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
