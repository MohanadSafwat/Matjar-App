import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/Cart.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'package:matjar_login_signup/sellerDashboard.dart';
import 'package:provider/provider.dart';
import 'actions/productService.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'items.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'Categories.dart';
import 'Search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'modules/item.dart';
import 'modules/user.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductService _productService = new ProductService();

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
      print(cat);
      cat.forEach((element) {
        getItems(element);
      });
    } catch (e) {
      print(e);
    }
  }

  String maxCat;
  @override
  void initState() {
    getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);
    double width = MediaQuery.of(context).size.width;

    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userData = snapshot.data;
            var data = [
              {
                'name': 'Electronics',
                'color': Colors.white,
                'icon': Icons.electrical_services_outlined
              },
              {
                'name': 'Mobiles',
                'color': Colors.white,
                'icon': Icons.phone_android_rounded
              },
              {
                'name': 'Fashion',
                'color': Colors.white,
                'icon': Icons.umbrella_rounded
              },
              {
                'name': 'Kitchen Tools',
                'color': Colors.white,
                'icon': Icons.food_bank_rounded
              },
            ];
            Color textColor =
                (!userData.darkmode) ? Colors.black : Colors.white;
            Color boxShadowColor = (!userData.darkmode)
                ? Colors.grey.withOpacity(0.16)
                : Colors.white.withOpacity(0.05);
            Color boxDecorationColor = (!userData.darkmode)
                ? Colors.white
                : Color.fromRGBO(27, 27, 27, 1);
            Color buttonColor = Color.fromRGBO(255, 0, 0, 1);

            maxCat = DatabaseService(uid: user.uid)
                .getMaxCat(rec: userData.recommended);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
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
                body: Stack(children: <Widget>[
                  Positioned.fill(
                    child: ListView(children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //........................................................................................
                            Container(
                                height: 100,
                                color: (!userData.darkmode)
                                    ? Color.fromRGBO(255, 0, 0, 1)
                                    : Color.fromRGBO(27, 27, 27, 0.4),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: TextFormField(
                                            onTap: () {
                                              showSearch(
                                                context: context,
                                                delegate: DataSearch(
                                                    list: getItem,
                                                    recentSearch:
                                                        userData.recent,
                                                    uid: user.uid),
                                              );
                                            },
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                hoverColor: Colors.white,
                                                focusColor: Colors.white,
                                                prefixIcon: IconButton(
                                                    icon: Icon(Icons.search),
                                                    onPressed: () {
                                                      showSearch(
                                                        context: context,
                                                        delegate: DataSearch(
                                                            list: getItem,
                                                            recentSearch:
                                                                userData.recent,
                                                            uid: user.uid),
                                                      );
                                                    }),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                hintText: "Search")),
                                      )
                                    ])),

                            //.................................................................................
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Recommended",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                              margin: EdgeInsets.only(left: 25, top: 20),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                height: 200,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: _productService.loadCat(maxCat),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Item> products = [];
                                        for (var doc in snapshot.data.docs) {
                                          var data = doc.data();
                                          products.add(Item(
                                              brand: data['itemBrand'],
                                              name: data['itemName'],
                                              price: double.parse(
                                                  data['itemPrice'].toString()),
                                              sellerId: data['itemSellerId'],
                                              specs: data['itemSpecs'],
                                              numberInStock:
                                                  data['noOfItemsInStock'],
                                              url: data['photoUrl'],
                                              reviews:
                                                  (data['itemReviews'] == null)
                                                      ? null
                                                      : data['itemReviews'],
                                              categoryName:
                                                  data['itemCategoryName'],
                                              rate: (data['rate'] == null)
                                                  ? null
                                                  : double.parse(
                                                      data['rate'].toString()),
                                              id: doc.id));
                                        }
                                        return ListView.builder(
                                          itemCount: (products.length > 5)
                                              ? 5
                                              : products.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1),
                                            child: Card(
                                              elevation: 0,
                                              color: boxDecorationColor,
                                              semanticContainer: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Material(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  SelectedItem
                                                                      .id,
                                                                  arguments:
                                                                      products[
                                                                          index]);
                                                        },
                                                        child: GridTile(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                Image.network(
                                                              products[index]
                                                                  .url,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            left: 8.0,
                                                            bottom: 12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          products[index].name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              color: textColor),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text("Egp ",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10.0,
                                                                  color:
                                                                      textColor,
                                                                )),
                                                            Text(
                                                              "${products[index].price}",
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
                                        );
                                      }
                                      return Center(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: Text("Categories",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: (!userData.darkmode)
                                          ? Colors.black
                                          : Colors.white,
                                    )),
                              ),
                              margin: EdgeInsets.only(left: 25),
                            ),

                            Center(
                                child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 45.0, // gap between adjacent chips
                                    runSpacing: 7.0, // gap between lines
                                    children: data
                                        .map((e) => Column(
                                              children: <Widget>[
                                                Card(
                                                  elevation: 0,
                                                  semanticContainer: true,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await DatabaseService(
                                                              uid: user.uid)
                                                          .recommendedUpdate(
                                                              cat: e["name"],
                                                              count: userData
                                                                      .recommended[
                                                                  e["name"]],
                                                              rec: userData
                                                                  .recommended);

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Items(
                                                            category: e["name"],
                                                            show: true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      color: e["color"],
                                                      child: SizedBox(
                                                          width: 130,
                                                          height: 130,
                                                          child: Icon(
                                                            e["icon"],
                                                            color: buttonColor,
                                                            size: 80,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    e["name"]
                                                        .toString()
                                                        .capitalize(),
                                                    style: TextStyle(
                                                      color:
                                                          (!userData.darkmode)
                                                              ? Colors.black
                                                              : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .toList())),

                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Offers",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: (!userData.darkmode)
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                              margin: EdgeInsets.only(left: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25),
                                height: 250,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: _productService.offeredItems(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Item> products = [];
                                        for (var doc in snapshot.data.docs) {
                                          var data = doc.data();
                                          products.add(Item(
                                              brand: data['itemBrand'],
                                              name: data['itemName'],
                                              price: double.parse(
                                                  data['itemPrice'].toString()),
                                              sellerId: data['itemSellerId'],
                                              specs: data['itemSpecs'],
                                              numberInStock:
                                                  data['noOfItemsInStock'],
                                              url: data['photoUrl'],
                                              reviews:
                                                  (data['itemReviews'] == null)
                                                      ? null
                                                      : data['itemReviews'],
                                              categoryName:
                                                  data['itemCategoryName'],
                                              rate: (data['rate'] == null)
                                                  ? null
                                                  : double.parse(
                                                      data['rate'].toString()),
                                              id: doc.id));
                                        }
                                        return Center(
                                          child: ListView.builder(
                                            itemCount: (products.length > 5)
                                                ? 5
                                                : products.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1, vertical: 1),
                                              child: Card(
                                                elevation: 0,
                                                semanticContainer: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Center(
                                                        child: Material(
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushNamed(
                                                                        SelectedItem
                                                                            .id,
                                                                        arguments:
                                                                            products[index]);
                                                              },
                                                              child: Center(
                                                                child: GridTile(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      products[
                                                                              index]
                                                                          .url,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              bottom: 12),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            products[index]
                                                                .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontSize: 12.0,
                                                                color: Colors
                                                                    .black87),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Egp ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                              Text(
                                                                "${products[index].price}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Egp ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "${(products[index].price * (100 - userData.offer) / 100).toString()}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                ),
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
                                        );
                                      }
                                      return Center(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    ]),
                  ),
                  //..................................................................................................................
                ]));
          } else {
            return Scaffold(
              body: Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}

/// Must be add i cart button
// onTap: () async {
// await DatabaseService(
// uid: user.uid)
// .offerUpdate(
// offer:
// userData.offer);
// },

// Text(
// "\$${featuredItems[index].price}",
// style: TextStyle(
// decoration: TextDecoration
//     .lineThrough,
// fontSize: 12.0,
// ),
// ),
// Text(
// "\$${(featuredItems[index].price * (100 - userData.offer) / 100).toString()}",
// style: TextStyle(
// fontSize: 18.0,
// fontWeight:
// FontWeight.bold),
// ),
// Text(
// featuredItems[index].name,
// overflow:
// TextOverflow.ellipsis,
// textAlign: TextAlign.left,
// style: TextStyle(
// fontSize: 15.0,
// color: Colors.grey),
// ),
