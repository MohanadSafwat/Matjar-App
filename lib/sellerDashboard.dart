import 'package:flutter/material.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';
import 'constants.dart';

var white = Colors.white;
int currentIndex = 3;

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
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
          /* onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }, */
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Dashboard',
                      style: TextStyle(
                        fontSize: 21,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              padding: EdgeInsets.all(31),
              //height: 700,
              width: 700,
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
              child: Column(
                children: [
                  Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  CustomTextField(lable: 'Product Name'),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Photos',
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey[700]),
                          ),
                          CustomButton(
                              text: 'Upload',
                              vertical: 1,
                              horizontal: 2,
                              fnc: () {}),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(lable: 'Category'),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(lable: 'Price'),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(lable: 'Number of items'),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(lable: 'Brand'),
                  Padding(padding: EdgeInsets.all(5)),
                  CustomTextField(lable: 'Specs'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                            text: 'Add',
                            vertical: 10,
                            horizontal: 12,
                            fnc: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

// class Login extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return LoginState();
//   }
// }
//
// class LoginState extends State<Login> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomPadding: false,
//         backgroundColor: white,
//         appBar: AppBar(
//           title: Text(
//             "Matjar",
//             style: TextStyle(
//               fontSize: 30,
//               fontFamily: "DancingScript",
//             ),
//           ),
//           backgroundColor: mainColor,
//           toolbarHeight: 80,
//           centerTitle: true,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           fixedColor: Colors.red, // <----------------
//           unselectedItemColor: mainColor,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           backgroundColor: white,
//           iconSize: 30,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calculate),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_sharp),
//               label: "",
//             ),
//           ],
//           /* onTap: (int x) => (x == 0)
//               ? print("index 0 : go to first page")
//               : print("not avilable now"), */
//         ),
//         body: Container(
//           margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
//           //height: 700,
//           width: 700,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 3,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: ListView(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Welcome Back",
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: mainColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Email",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: TextField(
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: mainColor,
//                         ),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: "Enter your Email",
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Password",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: TextField(
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: mainColor,
//                         ),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: "Enter your password",
//                         ),
//                         obscureText: true,
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         child: Text(
//                           "Forget Password?",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                         onPressed: () => print("forget"),
//                       ),
//                     ),
//                     Container(
//                       width: 290.0,
//                       height: 50,
//                       child: ButtonTheme(
//                         child: ElevatedButton(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               color: white,
//                               fontSize: 25,
//                             ),
//                           ),
//                           onPressed: (){},
//                           style: ButtonStyle(
//                             backgroundColor:
//                             MaterialStateProperty.all<Color>(mainColor),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           child: Text(
//                             "Don't have an account?",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: TextButton(
//                             child: Text(
//                               "Sign up",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                             onPressed: () =>
//                                 Navigator.of(context).pushNamed('/SignUp'),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
