import 'package:flutter/material.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';
import 'Custom Widget/customComponents.dart';
import 'firebase/userDatabase.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'modules/user.dart';

//test
var white = Colors.white;
int currentIndex = 0;

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  ProductAction productAction;
  String url;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemCategoryController = TextEditingController();
  TextEditingController itemNoInStockController = TextEditingController();
  TextEditingController itemBrandController = TextEditingController();
  TextEditingController itemSpecsType1Controller = TextEditingController();
  TextEditingController itemSpecsType2Controller = TextEditingController();
  TextEditingController itemSpecsType3Controller = TextEditingController();
  TextEditingController itemSpecsType4Controller = TextEditingController();
  TextEditingController itemSpecsValue1Controller = TextEditingController();
  TextEditingController itemSpecsValue2Controller = TextEditingController();
  TextEditingController itemSpecsValue3Controller = TextEditingController();
  TextEditingController itemSpecsValue4Controller = TextEditingController();

  var photoText = 'Photo';
  List sellerProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchproducts();
  }

  fetchproducts() async {
    dynamic list = await getSellerProducts();
    if (list == null)
      print("products are empty");
    else {
      setState(() {
        sellerProducts = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);
    counter();
    int count = getCounter();
    getSellerId();
    String sellerId = sendID();
    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor:
                    (!userData.darkmode) ? Colors.white : Colors.black,
                appBar: AppBar(
                  toolbarHeight: 75,
                  titleSpacing: 0,
                  backgroundColor: (!userData.darkmode)
                      ? Color.fromRGBO(255, 0, 0, 1)
                      : Color.fromRGBO(27, 27, 27, 0.4),
                  // toolbarHeight: 75,

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
                body: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dashboard,
                            size: 30,
                            color: textColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Dashboard',
                              style: TextStyle(fontSize: 21, color: textColor))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      padding: EdgeInsets.all(31),
                      //height: 700,
                      width: 700,

                      child: Column(
                        children: [
                          Text(
                            'Add Product',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: textColor),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: CustomTextField(
                                lable: 'Product Name',
                                control: itemNameController,
                                textColor: textColor,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    photoText,
                                    style: TextStyle(
                                        fontSize: 17.0, color: textColor),
                                  ),
                                  CustomButton(
                                    text: 'Upload',
                                    vertical: 1,
                                    color: buttonColor,
                                    horizontal: 2,
                                    fnc: () {
                                      uploadImage()
                                          .whenComplete(() => setState(() {
                                                photoText = 'Photo Uploaded';
                                                url = getUrl();
                                              }));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: CustomTextField(
                                textColor: textColor,
                                lable: 'Category',
                                control: itemCategoryController,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: CustomTextField(
                                lable: 'Price',
                                control: itemPriceController,
                                textColor: textColor,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: CustomTextField(
                                textColor: textColor,
                                lable: 'Number of items',
                                control: itemNoInStockController,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: CustomTextField(
                                textColor: textColor,
                                lable: 'Brand',
                                control: itemBrandController,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            decoration: BoxDecoration(
                              color: (!userData.darkmode)
                                  ? Colors.white
                                  : Color.fromRGBO(27, 27, 27, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: (!userData.darkmode)
                                      ? Colors.grey.withOpacity(0.16)
                                      : Colors.white.withOpacity(0.05),

                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Specs',
                                      style: TextStyle(
                                          fontSize: 17.0, color: textColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: CustomTextField(
                                          lable: 'Name',
                                          textColor: textColor,
                                          control: itemSpecsType1Controller,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                            lable: 'Value',
                                            textColor: textColor,
                                            control: itemSpecsValue1Controller),
                                      )
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: CustomTextField(
                                          lable: 'Name',
                                          textColor: textColor,
                                          control: itemSpecsType2Controller,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                            lable: 'Value',
                                            textColor: textColor,
                                            control: itemSpecsValue2Controller),
                                      )
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: CustomTextField(
                                          lable: 'Name',
                                          textColor: textColor,
                                          control: itemSpecsType3Controller,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                            lable: 'Value',
                                            textColor: textColor,
                                            control: itemSpecsValue3Controller),
                                      )
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Expanded(
                                        child: CustomTextField(
                                          lable: 'Name',
                                          textColor: textColor,
                                          control: itemSpecsType4Controller,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                            lable: 'Value',
                                            textColor: textColor,
                                            control: itemSpecsValue4Controller),
                                      )
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(
                                  text: 'Add',
                                  vertical: 10,
                                  horizontal: 12,
                                  color: buttonColor,
                                  fnc: () {
                                    productAction = ProductAction();
                                    productAction.addProductToCategories(
                                        Item(
                                          name: itemNameController.text,
                                          brand: itemBrandController.text,
                                          price: double.parse(
                                              itemPriceController.text),
                                          categoryName:
                                              itemCategoryController.text,
                                          sellerId: sellerId.toString(),
                                          numberInStock: int.parse(
                                              itemNoInStockController.text),
                                          specs: {
                                            itemSpecsType1Controller.text:
                                                itemSpecsValue1Controller.text,
                                            itemSpecsType2Controller.text:
                                                itemSpecsValue2Controller.text,
                                            itemSpecsType3Controller.text:
                                                itemSpecsValue3Controller.text,
                                            itemSpecsType4Controller.text:
                                                itemSpecsValue4Controller.text,
                                          },
                                        ),
                                        count.toString());
                                    addCounter(count);
                                    setState(() {
                                      sellerProducts.add({
                                        'photoUrl': url,
                                        'itemPrice': double.parse(
                                            itemPriceController.text),
                                        'itemName': itemNameController.text,
                                        'noOfItemsInStock': int.parse(
                                            itemNoInStockController.text),
                                      });
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Items In Stock',
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor
                          )),
                      margin: EdgeInsets.only(left: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:35.0),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sellerProducts.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1, vertical: 1),
                            child: Card(
                              elevation: 0,

                              color: boxDecorationColor,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Material(
                                      child: InkWell(
                                        child: GridTile(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Image.network(
                                              sellerProducts[index]['photoUrl'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 8.0, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                         "${sellerProducts[index]['itemName']}",
                                          textAlign:
                                          TextAlign.left,
                                          overflow: TextOverflow
                                              .fade,



                                        style: TextStyle(
                                        fontSize: 10.0,
                                        color: textColor),
                                        ),
                                        Row(
                                          children: [
                                            Text("Egp ",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: textColor,
                                                )),

                                            Text(
                                              '${sellerProducts[index]['itemPrice']}',
                                              softWrap: true,
                                              style: TextStyle(

                                                  fontSize:
                                                  12.0,
                                                  color:
                                                  textColor,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                          ],

                                        ),
                                        Row(
                                          children: [
                                            Text("no in stock ",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: textColor,
                                                )),

                                            Text(
                                              "${sellerProducts[index]['noOfItemsInStock']}",
                                              style: TextStyle(
                                                  fontSize:
                                                  12.0,
                                                  color:
                                                  textColor,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                          ],

                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),


                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
