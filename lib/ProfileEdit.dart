import 'package:flutter/material.dart';
import 'matjar_icons1.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';
import 'modules/user.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEdit> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);
    return StreamBuilder<Account>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Account userData = snapshot.data;
            TextEditingController firstNameController =
                TextEditingController(text: userData.firstName);
            TextEditingController lastNameController =
                TextEditingController(text: userData.lastName);
            TextEditingController addressController =
                TextEditingController(text: userData.address);
            TextEditingController contactController =
                TextEditingController(text: userData.contact);
            TextEditingController currencyController =
                TextEditingController(text: userData.currency);
            return new Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  "Matjar",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "DancingScript",
                  ),
                ),
                backgroundColor: mainColor,
                toolbarHeight: 80,
                centerTitle: true,
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                currentIndex: currentIndex,
                backgroundColor: Colors.white,
                selectedFontSize: 13,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.home,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.categories,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.cart,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.sign_in_and_sign_up_logo,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 3) {
                      Navigator.of(context).pushNamed('/Profile');
                    }
                  });
                },
              ),
              body: new Container(
                  padding: new EdgeInsets.all(31),
                  child: new ListView(
                    children: [
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                              ),
                              new Text('Profile',
                                  style: TextStyle(
                                    fontSize: 21,
                                  ))
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new TextFormField(
                            //initialValue: userData.firstName,
                            controller: firstNameController,
                            decoration: new InputDecoration(
                                labelText: 'First Name',
                                border: OutlineInputBorder()),
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new TextFormField(
                            //initialValue: userData.lastName,
                            controller: lastNameController,
                            decoration: new InputDecoration(
                                labelText: 'Last Name',
                                border: OutlineInputBorder()),
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new TextFormField(
                            //initialValue: userData.address,
                            controller: addressController,
                            decoration: new InputDecoration(
                                labelText: 'Address',
                                border: OutlineInputBorder()),
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new TextFormField(
                            //initialValue: userData.contact,
                            controller: contactController,
                            decoration: new InputDecoration(
                                labelText: 'Contact',
                                border: OutlineInputBorder()),
                          ),
                          new Padding(padding: EdgeInsets.all(5)),
                          new TextFormField(
                            //initialValue: userData.currency,
                            controller: currencyController,
                            decoration: new InputDecoration(
                                labelText: 'Currency',
                                border: OutlineInputBorder()),
                          ),
                          new Container(
                            padding: new EdgeInsets.all(31),
                            child: new RaisedButton(
                              onPressed: () async {
                                await DatabaseService(uid: user.uid).userEdit(
                                    firstNameController.text,
                                    lastNameController.text,
                                    addressController.text,
                                    contactController.text,
                                    currencyController.text);
                                Navigator.of(context).pushNamed("/ProfileInfo");
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Source Sans Pro',
                                  color: Colors.white,
                                ),
                              ),
                              color: Color.fromRGBO(255, 0, 0, 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainColor,
                ),
              ),
            );
          }
        });
  }
}
