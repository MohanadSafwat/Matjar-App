import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'Search.dart';
import 'actions/productService.dart';
import 'matjar_icons.dart';
import 'modules/item.dart';
import 'Categories.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Items extends StatefulWidget {
  static String id = 'Items';
  String query, category;
  bool show;
  Items({this.query, this.category, this.show});
  @override
  _ItemsState createState() =>
      _ItemsState(query: query, category: category, show: show);
}

class _ItemsState extends State<Items> {
  ProductService _productService = new ProductService();
  String query, category;
  bool show;
  List<Item> products = [];
  _ItemsState({this.query, this.category, this.show});
  var cat = [];
  var getItem = [];
  Future getItems(String doc) async {
    var datafetch = await FirebaseFirestore.instance
        .collection('Categories')
        .doc(doc)
        .collection('items')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        getItem.add(element['itemName']);
      });
    });
  }

  Future<void> getAllItems() async {
    try {
      await FirebaseFirestore.instance
          .collection('Categories')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          cat.add(element.id);
        });
      });
      cat.forEach((element) {
        getItems(element);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: show
            ? AppBar(
                backgroundColor: Color.fromRGBO(255, 0, 0, 1),
                // toolbarHeight: 75,
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
                  FlatButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: DataSearch(list: getItem),
                        );
                      },
                      child: Icon(
                        Matjar.search_logo,
                        size: 35,
                        color: Colors.white,
                      )),
                ],
              )
            : null,
        body: Stack(children: <Widget>[
          Positioned.fill(
            child: ListView(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
                  Container(
                      height: 60,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: width * 0.1),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Matjar.filter, color: Colors.red),
                          ),
                          Text("filter",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          SizedBox(width: width * 0.3),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Matjar.sort, color: Colors.red)),
                          Text(
                            "sort",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                          SizedBox(width: width * 0.1),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      height: 530,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: (query != null)
                              ? _productService.loadSearch()
                              : _productService.loadCat(category),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              for (var doc in snapshot.data.docs) {
                                var data = doc.data();
                                if (query != null) {
                                  if (data['name'].startsWith(query))
                                    products.add(Item(
                                      name: data['name'],
                                      url: data['img'],
                                      price: double.parse(
                                          data['price'].toString()),
                                    ));
                                } else
                                  products.add(Item(
                                    name: (data['itemName'] != null)
                                        ? data['itemName']
                                        : 'xx',
                                    url: data['photoUrl'],
                                    price: double.parse(
                                        data['itemPrice'].toString()),
                                  ));
                              }
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: products.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 1),
                                  child: Card(
                                    elevation: 0,
                                    semanticContainer: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Material(
                                            child: InkWell(
                                              onTap: () {},
                                              child: GridTile(
                                                child: Image.network(
                                                  products[index].url,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "\$${products[index].price}",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                products[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Center(
                              child: Text('Loading...'),
                            );
                          }),
                    ),
                  ),
                ]),
              ],
            ),
          ),

          //.....................................................................................................................
          Positioned(
              width: width,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          icon: Icon(
                            Matjar.home,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                          },
                          icon: Icon(
                            Matjar.categories,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Matjar.cart,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Matjar.sign_in_and_sign_up_logo,
                            color: Colors.red,
                          )),
                    ]),
              ))
        ]));
  }
}
