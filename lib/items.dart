import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'Cart.dart';
import 'Search.dart';
import 'actions/productService.dart';
import 'firebase/userDatabase.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'modules/item.dart';
import 'Categories.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modules/user.dart';

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
  List<Item> products = [];
  List<Item> temp = [];
  List<Item> ref = [];
  List<Item> ref2 = [];
  List<Item> ref3 = [];
int currentIndex = 0;
  bool flagSort = false;
  bool flagFilter = false;
  bool flag = false;
  bool flagBrand = false;
  bool flagPriceLimitation = false;
  bool checkedValue;
  bool flagBrandSelected = false;
  bool flagPriceSelected = false;
  bool validatePriceFrom = false;
  bool validatePriceTo = false;

  List<String> brands = [];
  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  List<bool> brandCheckBoxValues = [];
  ProductService _productService = new ProductService();
  String query, category;
  bool show;
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
    final user = Provider.of<Userinit>(context);
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
            Color appBarColor= (!userData.darkmode)
                ? Color.fromRGBO(255, 0, 0, 1)
                : Color.fromRGBO(27, 27, 27, 0.4);
            return Scaffold(
                backgroundColor:
                    (!userData.darkmode) ? Colors.white : Colors.black,
                appBar: show
                    ? AppBar(
                        backgroundColor: (!userData.darkmode)
                            ? Color.fromRGBO(255, 0, 0, 1)
                            : Color.fromRGBO(27, 27, 27, 0.4),
                        toolbarHeight: 75,
                        centerTitle: true,
                        leading: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Home');
                          },
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
                            width: 110,
                          ),
                          FlatButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: DataSearch(
                                      list: getItem,
                                      recentSearch: userData.recent,
                                      uid: user.uid,
                                    colors:{'textColor':textColor,
                                      'boxDecorationColor':boxDecorationColor,
                                      'boxShadowColor':boxShadowColor,
                                      'buttonColor':buttonColor,
                                      'appBarColor':appBarColor,


                                    }
                                  ),
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
                      if (currentIndex == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      }
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
                    child: ListView(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 60,
                                color: (!userData.darkmode)
                                    ? Colors.white
                                    : Colors.black,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: width * 0.1),
                                    Expanded(
                                      child: FlatButton(
                                        child: Row(
                                          children: [
                                            Icon(Matjar.filter,
                                                color: (!userData.darkmode)
                                                    ? Colors.red
                                                    : Colors.white),
                                            SizedBox(width: 10),
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: (!userData.darkmode)
                                                      ? Colors.red
                                                      : Colors.white),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            flagSort = false;
                                            flagFilter = true;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 75),
                                    Expanded(
                                      child: FlatButton(
                                        child: Row(
                                          children: [
                                            Icon(Matjar.sort,
                                                color: (!userData.darkmode)
                                                    ? Colors.red
                                                    : Colors.white),
                                            SizedBox(width: 10),
                                            Text(
                                              "Sort",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: (!userData.darkmode)
                                                      ? Colors.red
                                                      : Colors.white),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            flagSort = true;
                                            flagFilter = false;
                                            flagBrand = false;
                                            flagPriceLimitation = false;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.1),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: flagSort,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              temp = (flagBrandSelected ||
                                                      flagPriceSelected)
                                                  ? temp
                                                  : [...products];
                                              print(temp);
                                              temp.sort((a, b) =>
                                                  a.price.compareTo(b.price));
                                              flag = true;
                                            });
                                          },
                                          child: Text(
                                            'LOW TO HIGH',
                                            style: TextStyle(
                                                color: (!userData.darkmode)
                                                    ? Colors.red
                                                    : Colors.white),
                                          ),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                temp = (flagBrandSelected ||
                                                        flagPriceSelected)
                                                    ? temp
                                                    : [...products];
                                                print(temp);
                                                temp.sort((b, a) =>
                                                    a.price.compareTo(b.price));
                                                flag = true;
                                              });
                                            },
                                            child: Text(
                                              'HIGH TO LOW',
                                              style: TextStyle(
                                                  color: (!userData.darkmode)
                                                      ? Colors.red
                                                      : Colors.white),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: flagFilter,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              temp = (flagSort ||
                                                      flagPriceSelected)
                                                  ? temp
                                                  : [...products];
                                              brands = getBrandName(temp);
                                              // print(brandCheckBoxValues);
                                              setBrandCheckBoxValues(
                                                  brandCheckBoxValues,
                                                  brands.length);
                                              // print(brandCheckBoxValues);
                                              flagBrand = true;
                                              flagFilter = true;
                                              flagSort = false;
                                              flagPriceLimitation = false;
                                            });
                                          },
                                          child: Text(
                                            'Brand',
                                            style: TextStyle(
                                                color: (!userData.darkmode)
                                                    ? Colors.red
                                                    : Colors.white),
                                          ),
                                        ),
                                        FlatButton(
                                            onPressed: () {

                                              setState(() {
                                                flagPriceLimitation = true;
                                                flagBrand = false;
                                              });
                                            },
                                            child: Text(
                                              'Price Limitation',
                                              style: TextStyle(
                                                  color: (!userData.darkmode)
                                                      ? Colors.red
                                                      : Colors.white),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: flagBrand,
                                child: Container(
                                  color: boxDecorationColor,
                                  child: ListView.builder(
                                      itemCount: brands.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                checkColor: textColor,


                                                value:
                                                    brandCheckBoxValues[index],
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    flag = true;
                                                    ref = (flagSort ||
                                                            flagPriceSelected)
                                                        ? [...temp]
                                                        : [...products];
                                                    if (flagPriceSelected)
                                                      ref = [...ref2];
                                                    // print('ref');
                                                    // print(ref);
                                                    List<String>
                                                        brandsFiltered = [];
                                                    brandCheckBoxValues[index] =
                                                        newValue;
                                                    for (int i = 0;
                                                        i <
                                                            brandCheckBoxValues
                                                                .length;
                                                        i++) {
                                                      if (brandCheckBoxValues[
                                                              i] ==
                                                          true) {
                                                        flagBrandSelected =
                                                            true;
                                                        brandsFiltered
                                                            .add(brands[i]);
                                                        // print(brands[i]);
                                                      }
                                                    }

                                                    temp =
                                                        filterProductsByBrand(
                                                            ref,
                                                            brandsFiltered);
                                                    ref3 = [...temp];
                                                    /* print(
                                                        brandCheckBoxValues[0]);
                                                    print(brands[0]);
                                                    print(flagBrandSelected);
                                                    print('in check $temp'); */
                                                  });
                                                },
                                              ),
                                              Text(brands[index],
                                              style: TextStyle(color: textColor,),)
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              Visibility(
                                visible: flagPriceLimitation,
                                child: Padding(
                                  padding: const EdgeInsets.all(.0),
                                  child: Container(
                                    color: boxDecorationColor,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: TextField(
                                              controller: priceFrom,
                                              decoration: new InputDecoration(
                                                labelText: "From",
                                                labelStyle: TextStyle(color:textColor ),
                                                errorText: validatePriceFrom
                                                    ? 'Value Can\'t Be Empty'
                                                    : null,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: TextField(
                                              controller: priceTo,
                                              decoration: InputDecoration(
                                                labelText: 'To',
                                                labelStyle: TextStyle(color:textColor ),

                                                errorText: validatePriceTo
                                                    ? 'Value Can\'t Be Empty'
                                                    : null,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: FlatButton(
                                              child: Text(
                                                'Apply',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  priceTo.text.isEmpty
                                                      ? validatePriceTo = true
                                                      : validatePriceTo = false;
                                                  priceFrom.text.isEmpty
                                                      ? validatePriceFrom = true
                                                      : validatePriceFrom =
                                                          false;

                                                  flag = true;
                                                  ref = (flagSort ||
                                                          flagBrandSelected)
                                                      ? [...temp]
                                                      : [...products];
                                                  if (flagBrandSelected) {
                                                    ref = [...ref3];
                                                  }
                                                  flagPriceSelected = true;

                                                  temp = filterProductsByPrice(
                                                      ref,
                                                      double.parse(
                                                          priceFrom.text),
                                                      double.parse(
                                                          priceTo.text));
                                                  ref2 = [...temp];
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Container(
                                  height: 300,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: (query != null)
                                          ? _productService.loadSearch()
                                          : _productService.loadCat(category),
                                      builder: (context, snapshot) {
                                        products.clear();
                                        if (snapshot.hasData) {
                                          for (var doc in snapshot.data.docs) {
                                            var data = doc.data();
                                            if (query != null) {
                                              if (data['itemName']
                                                  .startsWith(query))
                                                products.add(Item(
                                                    brand: data['itemBrand'],
                                                    name: data['itemName'],
                                                    price: double.parse(
                                                        data['itemPrice']
                                                            .toString()),
                                                    sellerId:
                                                        data['itemSellerId'],
                                                    specs: data['itemSpecs'],
                                                    numberInStock: int.parse(
                                                        data['noOfItemsInStock']
                                                            .toString()),
                                                    url: data['photoUrl'],
                                                    categoryName: data[
                                                        'itemCategoryName'],
                                                    reviews: (data['itemReviews'] ==
                                                            null)
                                                        ? null
                                                        : data['itemReviews'],
                                                    rate: (data['rate'] == null)
                                                        ? null
                                                        : double.parse(
                                                            data['rate'].toString()),
                                                    id: doc.id));
                                            } else {
                                              products.add(Item(
                                                  brand: data['itemBrand'],
                                                  name: data['itemName'],
                                                  price: double.parse(
                                                      data['itemPrice']
                                                          .toString()),
                                                  sellerId:
                                                      data['itemSellerId'],
                                                  specs: data['itemSpecs'],
                                                  numberInStock: int.parse(
                                                      data['noOfItemsInStock']
                                                          .toString()),
                                                  url: data['photoUrl'],
                                                  categoryName: category,
                                                  reviews:
                                                      (data['itemReviews'] ==
                                                              null)
                                                          ? null
                                                          : data['itemReviews'],
                                                  rate: (data['rate'] == null)
                                                      ? null
                                                      : double.parse(
                                                          data['rate']
                                                              .toString()),
                                                  id: doc.id));
                                            }
                                          }
                                          return GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2),
                                            itemCount: (!flag)
                                                ? products.length
                                                : temp.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1, vertical: 1),
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
                                                              onTap: () async {
                                                                await DatabaseService(uid: user.uid).recommendedUpdate(
                                                                    cat: (!flag)
                                                                        ? products[
                                                                    index]
                                                                        .categoryName
                                                                        : temp[index]
                                                                        .categoryName,
                                                                    count: (!flag)
                                                                        ? userData
                                                                        .recommended[products[
                                                                    index]
                                                                        .categoryName]
                                                                        : userData
                                                                        .recommended[temp[
                                                                    index]
                                                                        .categoryName],
                                                                    rec: userData
                                                                        .recommended);
                                                                Navigator.of(context).pushNamed(
                                                                    SelectedItem.id,
                                                                    arguments: (!flag)
                                                                        ? products[
                                                                    index]
                                                                        : temp[
                                                                    index]);
                                                              },
                                                              child: Center(
                                                                child: Image.network(
                                                                  (!flag)
                                                                      ? products[
                                                                  index]
                                                                      .url
                                                                      : temp[index]
                                                                      .url,
                                                                  fit: BoxFit.cover,
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
                                                                (!flag)
                                                                    ? products[
                                                                index]
                                                                    .name
                                                                    : temp[index]
                                                                    .name,

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
                                                                    (!flag)
                                                                        ? "${products[index].price}"
                                                                        : "${temp[index].price}",
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
                                          child: CircularProgressIndicator(),
                                        );
                                      }),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),

                  //.....................................................................................................................
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

List<String> getBrandName(List<Item> products) {
  List<String> brands = [];
  for (Item product in products) {
    brands.add(product.brand);
  }
  return brands.toSet().toList();
}

setBrandCheckBoxValues(List<bool> values, int num) {
  for (int n = 0; n < num && values.length < num; n++) {
    values.add(false);
  }
}

filterProductsByBrand(List<Item> products, List<String> brands) {
  List<Item> filteredProducts = [];
  for (String brand in brands) {
    for (Item product in products) {
      if (product.brand == brand) {
        filteredProducts.add(product);
      }
    }
  }
  return filteredProducts;
}

filterProductsByPrice(List<Item> products, double priceFrom, double priceTo) {
  List<Item> filteredProducts = [];
  for (Item product in products) {
    if (product.price <= priceTo && product.price >= priceFrom) {
      filteredProducts.add(product);
    }
  }
  return filteredProducts;
}
