import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/constants.dart';
import 'package:matjar_login_signup/modules/cardItem.dart';
import 'package:matjar_login_signup/payment.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'constants.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:matjar_login_signup/cartItem.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';
import 'package:matjar_login_signup/custom_menu.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'package:flutter_spinbox/material.dart';
import 'modules/user.dart';

double totalPrice = 0.0;
final List<CardItem> orderr = [];
List<num> quan = List.filled(20, 1);

class Cart extends StatelessWidget {
  static String id = 'Cart';
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    orderr.clear();
    final user = Provider.of<Userinit>(context);
    //List<Item> items = Provider.of<cartItem>(context).items;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
      body: StreamBuilder<DocumentSnapshot>(
          stream: CartItems(user.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LayoutBuilder(builder: (context, constrains) {
                if (snapshot.data.data()['cartItems'] != null) {
                  orderr.clear();
                  totalPrice = 0;
                  return Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Shopping Cart",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              orderr.add(
                                CardItem(
                                    quantity: quan[index],
                                    itemPrice: snapshot.data.data()['cartItems']
                                        [index]['itemPrice'],
                                    itemUrl: snapshot.data.data()['cartItems']
                                        [index]['itemUrl'],
                                    itemName: snapshot.data.data()['cartItems']
                                        [index]['itemName'],
                                    itemCategoryName:
                                        snapshot.data.data()['cartItems'][index]
                                            ['itemCategoryName'],
                                    itemId: snapshot.data.data()['cartItems']
                                        [index]['itemId'],
                                    noInStock: snapshot.data.data()['cartItems']
                                        [index]['noInStock']),
                              );
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTapUp: (details) {
                                    showCustomMenu(
                                        details, context, orderr[index]);
                                  },
                                  child: Container(
                                    height: screenHeight * 0.15,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              //color: Colors.grey,
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                          .data
                                                          .data()['cartItems']
                                                      [index]['itemUrl']),
                                                  fit: BoxFit.scaleDown),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left:14),
                                             // width: 100,
                                              child: Text(
                                                snapshot.data
                                                        .data()['cartItems']
                                                    [index]['itemName'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                                //textAlign: TextAlign.start,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 130,
                                                  child: SpinBox(
                                                    min: 1,
                                                    //decoration: InputDecoration(labelText: 'Basic'),
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    spacing: 34,
                                                    incrementIcon: Icon(
                                                        Icons.add_circle,
                                                        color: Colors.blue,
                                                        size: 25),
                                                    decrementIcon: Icon(
                                                        Icons.remove_circle,
                                                        size: 25),
                                                    max: double.parse(snapshot
                                                        .data
                                                        .data()['cartItems']
                                                            [index]['noInStock']
                                                        .toString()),
                                                    value: double.parse(
                                                        quan[index].toString()),
                                                    onChanged: (value) {
                                                      quan[index] = value;
                                                      orderr[index].quantity =
                                                          value;
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Egp ${snapshot.data.data()['cartItems'][index]['itemPrice']}',
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.data()['cartItems'].length,
                          ),
                        ),
                        ButtonTheme(
                          minWidth: screenwidth,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            )),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Payment.id, arguments: orderr);
                            },
                            child: Text(
                              'Order Now '.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Your Cart is Empty',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  );
                }
              });
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: mainColor,
                  ),
                ),
              );
            }
          }),
    );
  }

  void showCustomMenu(details, context, item) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;

    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
        items: [
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<cartItem>(context, listen: false).deleteItem(item);
              Navigator.pushNamed(context, SelectedItem.id, arguments: item);
            },
            child: Text('Edit'),
          ),
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<cartItem>(context, listen: false).deleteItem(item);
            },
            child: Text('Delete'),
          ),
        ]);
  }
}
