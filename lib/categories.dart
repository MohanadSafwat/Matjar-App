import 'package:flutter/material.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/profileLoggedIn.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'firebase/userDatabase.dart';
import 'items.dart';
import 'login.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'home.dart';
import 'modules/user.dart';

class Categories extends StatefulWidget {
  static String id = 'Categories';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<Userinit>(context);
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
                'name': 'mobiles',
                'color': Colors.white,
                'icon': Icons.phone_android_rounded
              },
              {
                'name': 'fashion',
                'color': Colors.white,
                'icon': Icons.umbrella_rounded
              },
              {
                'name': 'Kitchen Tools',
                'color':Colors.white,
                'icon': Icons.food_bank_rounded
              },
            ];
            int currentIndex = 1;
            Color linkColor = (!userData.darkmode)
                ? Color.fromRGBO(83, 169, 252, 1)
                : Color.fromRGBO(83, 169, 252, 1);
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
                backgroundColor:
                    (!userData.darkmode) ? Colors.white : Colors.black,
                appBar: AppBar(
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
                      if (currentIndex == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      }
                      if (currentIndex == 2) {
                        if (user.uid == 'ING2u4fnlgQBpkUqrCoitD619iD3' ||
                            user == null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart()));
                        }
                      }
                      if (currentIndex == 3) {
                        if (user.uid == 'ING2u4fnlgQBpkUqrCoitD619iD3' ||
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
                          Icon(Matjar.categories, color: textColor),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            "Categories",
                            style: TextStyle(fontSize: 30, color: textColor),
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
                                            Card(
                                              elevation: 0,
                                              semanticContainer: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                  color: (!userData.darkmode)
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList())),
                      ])),
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
