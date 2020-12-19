import 'package:flutter/material.dart';
import 'package:matjar_login_signup/actions/productActions.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
//test
var white = Colors.white;
int currentIndex = 3;

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  ProductAction productAction;
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Dashboard',
                      style: TextStyle(
                        fontSize: 21,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              padding: EdgeInsets.all(31),
              //height: 700,
              width: 700,
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
              child: Column(
                children: [
                  Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  CustomTextField(
                    lable: 'Product Name',
                    control: itemNameController,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            photoText,
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey[700]),
                          ),
                          CustomButton(
                            text: 'Upload',
                            vertical: 1,
                            horizontal: 2,
                            fnc: () {
                              uploadImage().whenComplete(() => setState(() {
                                    photoText = 'Photo Uploaded';
                                  }));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(
                    lable: 'Category',
                    control: itemCategoryController,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(
                    lable: 'Price',
                    control: itemPriceController,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(
                    lable: 'Number of items',
                    control: itemNoInStockController,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(
                    lable: 'Brand',
                    control: itemBrandController,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Specs',
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey[700]),
                          ),
                          Row(children: [
                            Expanded(
                              child: CustomTextField(
                                lable: 'Name',
                                control: itemSpecsType1Controller,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  lable: 'Value', control: itemSpecsValue1Controller),
                            )
                          ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                            Expanded(
                              child: CustomTextField(
                                lable: 'Name',
                                control: itemSpecsType2Controller,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  lable: 'Value', control: itemSpecsValue2Controller),
                            )
                          ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                            Expanded(
                              child: CustomTextField(
                                lable: 'Name',
                                control: itemSpecsType3Controller,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  lable: 'Value', control: itemSpecsValue3Controller),
                            )
                          ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                            Expanded(
                              child: CustomTextField(
                                lable: 'Name',
                                control: itemSpecsType4Controller,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  lable: 'Value', control: itemSpecsValue4Controller),
                            )
                          ])
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
                          fnc: () {
                            counter();
                            int count = getCounter();
                             getSellerId();
                             String sellerId = sendID();
                            productAction = ProductAction();
                            productAction.addProduct(Item(
                              name: itemNameController.text,
                              brand: itemBrandController.text,
                              price: double.parse(itemPriceController.text),
                              categoryName: itemCategoryController.text,
                              sellerId: sellerId.toString(),
                              numberInStock:
                              int.parse(itemNoInStockController.text),
                              specs: {
                                itemSpecsType1Controller.text:itemSpecsValue1Controller.text,
                                itemSpecsType2Controller.text:itemSpecsValue2Controller.text,
                                itemSpecsType3Controller.text:itemSpecsValue3Controller.text,
                                itemSpecsType4Controller.text:itemSpecsValue4Controller.text,
                              },
                            ),count.toString());
                            addCounter(count);
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
                  )),
              margin: EdgeInsets.only(left: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    child: Card(
                      child: SizedBox(
                        width: width * 0.3,
                      ),
                      margin: EdgeInsets.only(right: 5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}