import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'actions/productService.dart';
import 'matjar_icons.dart';

import 'Categories.dart';
import 'home.dart';

class Items extends StatefulWidget {
  static String id = 'Items';
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  ProductService _productService = new ProductService();

  _ItemsState() {
    listFeaturedItems();
  }
  List featuredItems = new List();

  void listFeaturedItems() async {
    List<Map<String, String>> featuredItemList =
        await _productService.featuredItems();
    setState(() {
      featuredItems = featuredItemList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
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
                onPressed: () {},
                child: Icon(
                  Matjar.search_logo,
                  size: 35,
                  color: Colors.white,
                )),
          ],
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
            child:

            ListView(
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
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                          child: Card(
                            elevation: 0,
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
                                      onTap: () {},
                                      child: GridTile(
                                        child: Image.network(
                                          featuredItems[index]['photoUrl'],
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
                                        "\$${featuredItems[index]['itemPrice']}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        featuredItems[index]['itemName'],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey),
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
