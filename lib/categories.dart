import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase/userDatabase.dart';
import 'items.dart';
import 'matjar_icons.dart';

import 'home.dart';
import 'modules/user.dart';

class Categories extends StatefulWidget {
  static String id = 'Categories';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
                appBar: AppBar(
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
                  ],
                ),
                body: Stack(children: <Widget>[
                  Positioned.fill(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        //................................................
//................................................................................................
                        SizedBox(height: 100),
                        Row(children: <Widget>[
                          SizedBox(
                            width: width * 0.07,
                          ),
                          Icon(
                            Matjar.categories,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 40,
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
//....................................................................................
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Card(
//                         child: SizedBox(
//                           width: width * 0.4,
//                           height: 120,
//                         ),
//                       ),
//                       Card(
//                         child: SizedBox(
//                           width: width * 0.4,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Card(
//                         child: SizedBox(
//                           width: width * 0.4,
//                           height: 120,
//                         ),
//                       ),
//                       Card(
//                         child: SizedBox(
//                           width: width * 0.4,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
                      ])),
                  //.......................................................................................................

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
                child: Text('ccxc'),
              ),
            );
          }
        });
  }
}
