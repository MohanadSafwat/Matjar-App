import 'package:flutter/material.dart';

var mainColor = Colors.red[700];
var white = Colors.white;

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            "Matjar",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "DancingScript",
            ),
          ),
          backgroundColor: mainColor,
          toolbarHeight: 80,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red, // <----------------
          unselectedItemColor: mainColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: white,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: "",
            ),
          ],
          /* onTap: (int x) => (x == 0)
              ? print("index 0 : go to fiter page")
              : print("not avilable now"), */
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create a new account",
                        style: TextStyle(
                          fontSize: 25,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your first name",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your last name",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your email",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password",
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                        ),
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password again",
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 290.0,
                      height: 50,
                      child: ButtonTheme(
                        child: ElevatedButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: white,
                              fontSize: 25,
                            ),
                          ),
                          onPressed: () => print("sign up"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
