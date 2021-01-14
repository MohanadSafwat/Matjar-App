import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'firebase/userDatabase.dart';
import 'items.dart';
import 'modules/user.dart';

class homee extends StatefulWidget {
  @override
  _homeeState createState() => _homeeState();
}

class _homeeState extends State<homee> {
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
            Color appBarColor = (!userData.darkmode)
                ? Color.fromRGBO(255, 0, 0, 1)
                : Color.fromRGBO(27, 27, 27, 0.4);

            return Scaffold(
              backgroundColor:
                  (!userData.darkmode) ? Colors.white : Colors.black,
              appBar: AppBar(
                title: Text("Searchable Text"),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: textColor,
                      ),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: DataSearch(list: getItem, colors: {
                            'textColor': textColor,
                            'boxDecorationColor': boxDecorationColor,
                            'boxShadowColor': boxShadowColor,
                            'buttonColor': buttonColor,
                            'appBarColor': appBarColor,
                          }),
                        );
                      })
                ],
              ),
              drawer: Drawer(),
            );
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

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  List<dynamic> recentSearch;
  String uid;
  Map<String, Color> colors = {};
  DataSearch({this.list, this.recentSearch, this.uid, this.colors});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Colors.white,
      )),
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: TextStyle(color: Colors.white)),
      primaryColor: colors['appBarColor'],
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    DatabaseService(uid: uid)
        .searchUpdate(searchList: recentSearch, searchItem: query);
    if (query == 'Electronics' ||
        query == 'Kitchen Tools' ||
        query == 'Fashion' ||
        query == 'Mobiles')
      return Items(category: query, show: false);
    else
      return Items(query: query.toLowerCase(), show: false);
  }

  @override
  buildSuggestions(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var suggestionList = query.isEmpty
        ? [...recentSearch]
        : list
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return Container(
      height: height,
      color: colors['boxDecorationColor'],
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
          leading: Icon(
            Icons.search,
            color: colors['textColor'],
          ),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: colors['textColor'],
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: colors['textColor'],
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
