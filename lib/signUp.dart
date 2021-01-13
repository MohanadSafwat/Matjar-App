import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/firebase/userDatabase.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';
import 'matjar_icons.dart';
import 'firebase/userDatabase.dart';
import 'modules/user.dart';

var mainColor = Colors.red[700];
var white = Colors.white;
var x,y;
  bool lastDoc = false;
 String uid,error="",passError="";
bool notexist=true;


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
  int currentIndex = 3;
  String err = "";
  /* Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((userCredential) {
        //User updateUser = FirebaseAuth.instance.currentUser;
        DatabaseService()
            .userSetup(_firstNameController.text, _lastNameController.text);
        Navigator.of(context).pushNamed('/Login');
      });
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: white,
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

///////////////////////////////////////////error

                      Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                       error,
                        style: TextStyle(
                          fontSize: 15,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                   

                       Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                       passError  ,
                        style: TextStyle(
                          fontSize: 15,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                          



                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "$err",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                        ),
                      ),
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
                        keyboardType: TextInputType.emailAddress,
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
                          onPressed: () async {
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              setState(() {
                                err = '*Unmatched passwords';
                              });
                            }else{ setState(() {
                                err = "";
                              });}


                                                                               
                    if(_passwordController.text.length < 6){
                       setState(() {
                    passError  =  "Password Must be >= 6 Characters";  });
                    return;
                      }else{
                         setState(() {
                    passError  =  "";  });
                      }
                            
                             
                             
                                 
                              if( passError=="" )
                        {
                           if( err=="" )
                                {
                                  try{
                                             final UserRef = await Firestore.instance
                                                .collection('Users')
                                                    // ignore: deprecated_member_use
                                                   .getDocuments()
                                         .then((QuerySnapshot snapshot) {
                                          // ignore: deprecated_member_use
                                          snapshot.documents.forEach((DocumentSnapshot doc) { 
                                            x =  doc.data()['email'].toString();
                                            
                                            

                                              if ( x == _emailController.text) {
                                                                     notexist=false;
                                             }  
                                             if( doc.id =="zzzzzzzzzz"){
                                               lastDoc = true;
                                             }
                                               
                                      
                                              });
                                          
                              
                               });
                                                    
                                
                          } on FirebaseAuthException catch(e){} 

                         if(lastDoc)
                              {
                                lastDoc = false;
                                 if (notexist  )           
                                     {
                               dynamic result = await AuthService().signup(
                                     _emailController.text,
                                  _passwordController.text,
                                  _firstNameController.text.trim(),
                                  _lastNameController.text.trim());
                               Navigator.of(context).pushNamed('/Login');
                                      }

                                      else  {
                                          setState(() { error = "  The email address is already in use by another account " ;});
                                       
                                      }
                                      notexist = true ;
                                       }    
                        }
                        }
                          },
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
                              fontSize: 13,
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
                                Navigator.of(context).pushNamed('/Login'),
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