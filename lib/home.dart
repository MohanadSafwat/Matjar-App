import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/sellerDashboard.dart';
import 'actions/particularItem.dart';
import 'actions/productService.dart';
import 'Custom Widget/customTransition.dart';
import 'matjar_icons.dart';
import 'Categories.dart';
import 'Search.dart';



class MyHomePage extends StatefulWidget {
  static String id = 'MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {


  ProductService _productService = new ProductService();

  _MyHomePageState(){
    listFeaturedItems();
  }
  List featuredItems  = new List();

  void listFeaturedItems() async{
    List<Map<String,String>> featuredItemList = await _productService.featuredItems();
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
    {'name': 'Electronics', 'color': Colors.red, 'icon': Icons.electrical_services_rounded},
    {'name': 'Mobiles', 'color': Colors.red, 'icon': Icons.phone_android_rounded},
    {'name': 'Fashion', 'color': Colors.red, 'icon': Icons.umbrella_rounded},
    {'name': 'Food', 'color': Colors.red, 'icon': Icons.food_bank_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
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
                                    delegate: DataSearch(),
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
                                            delegate: DataSearch(),
                                          );
                                        }),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
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

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
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
                                    onTap: () {
                                    },
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "\$${featuredItems[index]['itemPrice']}",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      featuredItems[index]['itemName'],
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey
                                      ),
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
                                onTap: (){
                                  print(e["name"]);
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
                  padding: const EdgeInsets.fromLTRB(25.0,25.0, 25.0, 40),
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
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
                                    onTap: () {
                                    },
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "\$${featuredItems[index]['itemPrice']}",
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "\$${featuredItems[index]['offer']}",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      featuredItems[index]['itemName'],
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey
                                      ),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellerDashboard()));
                          },
                          icon: Icon(
                            Matjar.sign_in_and_sign_up_logo,
                            color: Colors.red,
                          )),
                    ]),
              ))
        ]));
  }
}


// Padding(
//   padding: const EdgeInsets.all(20),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Card(
//         child: SizedBox(
//           width: width * 0.4,
//           height: 150,
//         ),
//       ),
//       Card(
//         child: SizedBox(
//           width: width * 0.4,
//           height: 150,
//         ),
//       ),
//     ],
//   ),
// ),
//
// Padding(
//   padding: const EdgeInsets.all(20),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Card(
//         child: SizedBox(
//           width: width * 0.4,
//           height: 150,
//         ),
//       ),
//       Card(
//         child: SizedBox(
//           width: width * 0.4,
//           height: 150,
//         ),
//       ),
//     ],
//   ),
// ),
