import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:matjar_login_signup/Cart.dart';
import 'package:matjar_login_signup/constants.dart';
import 'package:matjar_login_signup/home.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:matjar_login_signup/cartItem.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modules/cardItem.dart';
import 'modules/user.dart';

class Payment extends StatefulWidget {
  static String id = 'Payment';

  @override
  _PaymentState createState() => _PaymentState();
}

enum payment_method { credit, cash }
enum payment_currency { dollar, euro, pound }

class _PaymentState extends State<Payment> {
  payment_method _method = null;
  payment_currency _currency = payment_currency.dollar;

  final TextEditingController _nameOnCard = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _validThrough = TextEditingController();
  final TextEditingController _address = TextEditingController();
  int currentIndex = 3;

  int selectedRadio;
  var nameoncard = null;
  var cardnumber = null;
  var cvv = null;
  var valid = null;
  var address = null;
  double finalPrise = 0;
  double priseineuro = 0;
  double priseindollar = 0;
  double priseinpound = 0;
  var totalPrice = 0.0;

  int currencyChosen = 0;
  bool flagCreditcard = false;
  bool flagBuyCash = false;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> items = Provider.of<cartItem>(context).items;
    final user = Provider.of<Userinit>(context);
    var totalPrice = 0.0;
    final List<CardItem> order = ModalRoute.of(context).settings.arguments;
    for (int i = 0; i < order.length; i++) {
      totalPrice += order[i].itemPrice * order[i].quantity;
    }
    print("order lengh is ${order.length}");
    priseineuro = ((totalPrice as double) / 20);
    priseindollar = ((totalPrice as double) / 15);
    priseinpound = ((totalPrice as double) / 1);

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: ListView(
        children: <Widget>[
          AppBar(
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
          Column(
            children: [
              ListTile(
                title: Text('Buy throw credit card'),
                leading: Radio(
                  value: payment_method.credit,
                  groupValue: _method,
                  activeColor: Colors.red,
                  onChanged: (payment_method value) {
                    setState(() {
                      _method = value;
                      flagCreditcard = true;
                      flagBuyCash = false;
                      // print(_method.index);
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 39),
                child: Visibility(
                  visible: flagCreditcard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Name on card',
                            border: OutlineInputBorder(),
                          ),
                          controller: _nameOnCard,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            border: OutlineInputBorder(),
                          ),
                          controller: _cardNumber,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.only(left: 168),
                            padding: EdgeInsets.only(bottom: 10),
                            width: 130,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'valid',
                                border: OutlineInputBorder(),
                              ),
                              controller: _validThrough,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 38),
                            padding: EdgeInsets.only(bottom: 10),
                            width: 110,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'cvv',
                                border: OutlineInputBorder(),
                              ),
                              controller: _cvv,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('Buy cash'),
                leading: Radio(
                  value: payment_method.cash,
                  groupValue: _method,
                  activeColor: Colors.red,
                  onChanged: (payment_method value) {
                    setState(() {
                      _method = value;
                      flagBuyCash = true;
                      flagCreditcard = false;
                      // print(_method.index);
                    });
                  },
                ),
              ),
              Visibility(
                visible: flagBuyCash,
                child: Container(
                  margin: EdgeInsets.only(left: 38, right: 40),
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'where do you want to pick up',
                      border: OutlineInputBorder(),
                    ),
                    controller: _address,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 38, right: 40),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: Colors.red,
                            onChanged: (currencyChosed) {
                              currencyChosen = currencyChosed;
                              setSelectedRadio(currencyChosed);
                            },
                          ),
                          Text(
                            'Price in euros: e${priseineuro.toString()}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            activeColor: Colors.red,
                            onChanged: (currencyChosed) {
                              setState(() {
                                selectedRadio = currencyChosed;
                                setSelectedRadio(currencyChosed);
                              });
                              ;
                            },
                          ),
                          Text(
                            'Price in Pound: ${priseinpound.toString()} LE',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: selectedRadio,
                            activeColor: Colors.red,
                            onChanged: (currencyChosed) {
                              currencyChosen = currencyChosed;
                              setSelectedRadio(currencyChosed);
                              //print(currencyChosed);
                            },
                          ),
                          Text(
                            'Price in dollars: \$ ${priseindollar.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(left: 100),
                  width: 100,
                  child: Builder(
                    builder: (context) => RaisedButton(
                        child: Text(
                          'PURCHASE',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        onPressed: () async {
                          setState(() {
                            nameoncard = _nameOnCard.text;
                            cvv = _cvv.text;
                            valid = _validThrough.text;
                            cardnumber = _cardNumber.text;
                            address = _address.text;
                          });

                          if (_method.index == 0 &&
                              (cvv.toString().isEmpty ||
                                  currencyChosen == 0 ||
                                  valid.toString().isEmpty ||
                                  nameoncard.toString().isEmpty ||
                                  cardnumber.toString().isEmpty)) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Please Complete the requirments'),
                            ));
                          } else if (_method.index == 1 &&
                              address.toString().isEmpty) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Please Complete the requirments'),
                            ));
                          } else {
                            removeItemFromStock(order);
                            deleteProductsFromCart(user.uid);

                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Purchased Successfully'),
                            ));

                            //removeItemFromStock(orderedItems);

                            await Future.delayed(Duration(seconds: 2));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          }
                        },
                        color: Colors.red),
                  ))
            ],
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }

  void deleteItems(BuildContext context, List<Item> items) {
    cartItem cartitem = Provider.of<cartItem>(context, listen: false);
    cartitem.removeItems(items);
  }

  removeItemFromStock(List<CardItem> items) async {
    int newValue;
    for (int i = 0; i < items.length; i++) {
      if (items[i].quantity< items[i].noInStock) {
        items[i].noInStock -= items[i].quantity.toInt();
        newValue=int.parse(items[i].noInStock.toString());
        await upateStockInCategories(
            newValue, items[i].itemId, items[i].itemCategoryName);
        await FirebaseFirestore.instance
            .collection("products")
            .doc(items[i].itemId)
            .update({'noOfItemsInStock': newValue}).then(
                (value) => print("update numInStock in products${newValue}"));
      } else {
        await FirebaseFirestore.instance
            .collection("products")
            .doc(items[i].itemId)
            .delete();
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(items[i].itemCategoryName)
            .collection("items")
            .doc(items[i].itemId)
            .delete();
      }
    }
  }
}

Future<void> deleteProductsFromCart(String userId) {
  CollectionReference user = FirebaseFirestore.instance.collection('Users');
  return user.doc(userId).update({
    'cartItems': FieldValue.delete(),
  }).then((value) => print('products are deleted from cart'));
}

upateStockInCategories(int numInStock, String itemId, String categoryName) {
  CollectionReference firestore3 = FirebaseFirestore.instance
      .collection("Categories")
      .doc(categoryName)
      .collection('items');
  return firestore3.doc(itemId).update({
    'noOfItemsInStock': numInStock,
  }).then((value) => print('update numInStock to category'));
}
