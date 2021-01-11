import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'package:provider/provider.dart';
import 'Search.dart';
import 'actions/productService.dart';
import 'firebase/userDatabase.dart';
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
            return Scaffold(
                appBar: show
                    ? AppBar(
                        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
                        // toolbarHeight: 75,
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
                            width: 210,
                          ),
                          FlatButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: DataSearch(
                                      list: getItem,
                                      recentSearch: userData.recent,
                                      uid: user.uid),
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 60,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: width * 0.1),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          flagSort = false;
                                          flagFilter = true;
                                        });
                                      },
                                      icon: Icon(Matjar.filter,
                                          color: Colors.red),
                                    ),
                                    Text("filter",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red)),
                                    SizedBox(width: width * 0.3),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            flagSort = true;
                                            flagFilter = false;
                                            flagBrand = false;
                                            flagPriceLimitation = false;
                                          });
                                        },
                                        icon: Icon(Matjar.sort,
                                            color: Colors.red)),
                                    Text(
                                      "sort",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red),
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
                                            style: TextStyle(color: Colors.red),
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
                                              style:
                                                  TextStyle(color: Colors.red),
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
                                            style: TextStyle(color: Colors.red),
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
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: flagBrand,
                                child: Container(
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
                                                value:
                                                    brandCheckBoxValues[index],
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    flag = true;
                                                    ref = (flagSort ||
                                                            flagPriceSelected)
                                                        ? [...temp]
                                                        : [...products];
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
                                                    print(
                                                        brandCheckBoxValues[0]);
                                                    print(brands[0]);
                                                    print(flagBrandSelected);
                                                    print('in check $temp');
                                                  });
                                                },
                                              ),
                                              Text(brands[index]),
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
                                                  flagPriceSelected = true;

                                                  temp = filterProductsByPrice(
                                                      ref,
                                                      double.parse(
                                                          priceFrom.text),
                                                      double.parse(
                                                          priceTo.text));
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
                                  height: 530,
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
                                                          child: GridTile(
                                                            child:
                                                                Image.network(
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            (!flag)
                                                                ? "\$${products[index].price}"
                                                                : "\$${temp[index].price}",
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            (!flag)
                                                                ? products[
                                                                        index]
                                                                    .name
                                                                : temp[index]
                                                                    .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors
                                                                    .grey),
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
                                            builder: (context) =>
                                                MyHomePage()));
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
                                  onPressed: () {},
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
