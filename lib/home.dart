import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'package:matjar_login_signup/sellerDashboard.dart';
import 'package:provider/provider.dart';
import 'actions/productService.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'items.dart';
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

  _MyHomePageState() {
    listFeaturedItems();
  }
  List<Item> featuredItems = new List();

  void listFeaturedItems() async {
    List<Item> featuredItemList = await _productService.featuredItems();
    setState(() {
      featuredItems = featuredItemList;
    });
  }

  // void showParticularItem(Map item) async{
  //   String productId = item['productId'];
  //   Map itemDetails = await _productService.particularItem(productId);
  //   Navigator.push(
  //       context,
  //       CustomTransition(
  //           type: CustomTransitionType.downToUp,
  //           child: ParticularItem(
  //             itemDetails: itemDetails,
  //             edit: false,
  //           )
  //       )
  //   );
  // }

  var data = [
    {
      'name': 'Electronics',
      'color': Colors.red,
      'icon': Icons.electrical_services_rounded
    },
    {
      'name': 'mobiles',
      'color': Colors.red,
      'icon': Icons.phone_android_rounded
    },
    {'name': 'fashion', 'color': Colors.red, 'icon': Icons.umbrella_rounded},
    {
      'name': 'electronics',
      'color': Colors.red,
      'icon': Icons.food_bank_rounded
    },
  ];
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
            maxCat = DatabaseService(uid: user.uid)
                .getMaxCat(rec: userData.recommended);
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(255, 0, 0, 1),
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
                body: Stack(children: <Widget>[
                  Positioned.fill(
                    child: ListView(children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //........................................................................................
                            Container(
                                height: 100,
                                color: Color.fromRGBO(255, 0, 0, 1),
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
                                  )),
                              margin: EdgeInsets.only(left: 25),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(25.0),
                            //   child: Container(
                            //     height: 200,
                            //     child: ListView.builder(
                            //       itemCount: 5,
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) => Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             horizontal: 1, vertical: 1),
                            //         child: Card(
                            //           elevation: 0,
                            //           semanticContainer: true,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(10.0),
                            //           ),
                            //           clipBehavior: Clip.antiAlias,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: <Widget>[
                            //               Expanded(
                            //                 child: Material(
                            //                   child: InkWell(
                            //                     onTap: () {},
                            //                     child: GridTile(
                            //                       child: Image.network(
                            //                         featuredItems[index].url,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: <Widget>[
                            //                     Text(
                            //                       "\$${featuredItems[index].price}",
                            //                       style: TextStyle(
                            //                           fontSize: 18.0,
                            //                           fontWeight:
                            //                               FontWeight.bold),
                            //                     ),
                            //                     Text(
                            //                       featuredItems[index].name,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       textAlign: TextAlign.left,
                            //                       style: TextStyle(
                            //                           fontSize: 15.0,
                            //                           color: Colors.grey),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // PageView.builder(
                            //   itemCount: newArrivals.length,
                            //   controller: PageController(
                            //       viewportFraction: 0.7
                            //   ),
                            //   onPageChanged: (int index) => setState(()=> _index = index),
                            //   itemBuilder: (context,index){
                            //     var item = newArrivals[index];
                            //     return Transform.scale(
                            //       scale: index == _index ? 1 : 0.8,
                            //       child: Column(
                            //         children: <Widget>[
                            //           Container(
                            //             child: Expanded(
                            //               child: GestureDetector(
                            //                 onTap: () {
                            //                   // showParticularItem(item);
                            //                 },
                            //                 child: Card(
                            //                   semanticContainer: true,
                            //                   clipBehavior: Clip.antiAlias,
                            //                   elevation: 6,
                            //                   shape: RoundedRectangleBorder(
                            //                       borderRadius: BorderRadius.circular(20)
                            //                   ),
                            //                   child: Container(
                            //                     decoration: BoxDecoration(
                            //                       borderRadius:  BorderRadius.all(Radius.circular(8.0)),
                            //                       image: DecorationImage(
                            //                           image: NetworkImage(item['image']),
                            //                           fit: BoxFit.cover
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
                            //             child: index == _index ? Text(
                            //               item['name'],
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                   fontSize: 20.0
                            //               ),
                            //             ): Text(''),
                            //           )
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // ),
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
                                                horizontal: 1, vertical: 1),
                                            child: Card(
                                              elevation: 0,
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
                                                          child: Image.network(
                                                            products[index].url,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          "\$${products[index].price}",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          products[index].name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );

                                        //   GridView.builder(
                                        //   gridDelegate:
                                        //       SliverGridDelegateWithFixedCrossAxisCount(
                                        //           crossAxisCount: 2),
                                        //   itemCount: products.length,
                                        //   scrollDirection: Axis.vertical,
                                        //   itemBuilder: (context, index) =>
                                        //       Padding(
                                        //     padding: EdgeInsets.symmetric(
                                        //         horizontal: 1, vertical: 1),
                                        //     child: Card(
                                        //       elevation: 0,
                                        //       semanticContainer: true,
                                        //       shape: RoundedRectangleBorder(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10.0),
                                        //       ),
                                        //       clipBehavior: Clip.antiAlias,
                                        //       child: Column(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: <Widget>[
                                        //           Expanded(
                                        //             child: Material(
                                        //               child: InkWell(
                                        //                 onTap: () async {
                                        //                   await DatabaseService(
                                        //                           uid: user.uid)
                                        //                       .recommendedUpdate(
                                        //                           cat: products[
                                        //                                   index]
                                        //                               .categoryName,
                                        //                           count: userData
                                        //                               .recommended[products[
                                        //                                   index]
                                        //                               .categoryName],
                                        //                           rec: userData
                                        //                               .recommended);
                                        //                   Navigator.of(context)
                                        //                       .pushNamed(
                                        //                           SelectedItem
                                        //                               .id,
                                        //                           arguments:
                                        //                               products[
                                        //                                   index]);
                                        //                 },
                                        //                 child: GridTile(
                                        //                   child: Image.network(
                                        //                     products[index].url,
                                        //                     fit: BoxFit.cover,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //           Padding(
                                        //             padding:
                                        //                 const EdgeInsets.all(
                                        //                     8.0),
                                        //             child: Column(
                                        //               crossAxisAlignment:
                                        //                   CrossAxisAlignment
                                        //                       .start,
                                        //               children: <Widget>[
                                        //                 Text(
                                        //                   "\$${products[index].price}",
                                        //                   style: TextStyle(
                                        //                       fontSize: 18.0,
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .bold),
                                        //                 ),
                                        //                 Text(
                                        //                   products[index].name,
                                        //                   overflow: TextOverflow
                                        //                       .ellipsis,
                                        //                   textAlign:
                                        //                       TextAlign.left,
                                        //                   style: TextStyle(
                                        //                       fontSize: 15.0,
                                        //                       color:
                                        //                           Colors.grey),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                      }
                                      return Center(
                                        child: Text('Loading...'),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Categories",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
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
                                                ClipOval(
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
                                                            color: Colors.white,
                                                            size: 80,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Text(e["name"])
                                              ],
                                            ))
                                        .toList())),

                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Offers",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              margin: EdgeInsets.only(left: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  25.0, 25.0, 25.0, 40),
                              child: Container(
                                height: 200,
                                child: ListView.builder(
                                  itemCount:
                                      (featuredItems.length == 0) ? 0 : 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1, vertical: 1),
                                    child: Card(
                                      elevation: 0,
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
                                                          SelectedItem.id,
                                                          arguments:
                                                              featuredItems[
                                                                  index]);
                                                },
                                                child: GridTile(
                                                  child: Image.network(
                                                    featuredItems[index].url,
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
                                                  "\$${featuredItems[index].price}",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                Text(
                                                  "\$${(featuredItems[index].price * (100 - userData.offer) / 100).toString()}",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  featuredItems[index].name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                ),
                              ),
                            ),
                          ]),
                    ]),
                  ),
                  //..................................................................................................................
                  Positioned(
                      width: width,
                      bottom: 0,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Matjar.home,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Categories()));
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  },
                                  icon: Icon(
                                    Matjar.sign_in_and_sign_up_logo,
                                    color: Colors.red,
                                  )),
                            ]),
                      ))
                ]));
          } else {
            return Scaffold(
              body: Center(
                child: Text('ccxc'),
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
