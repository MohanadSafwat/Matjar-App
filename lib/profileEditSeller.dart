import 'package:flutter/material.dart';
import 'Custom Widget/customComponents.dart';
import 'matjar_icons.dart';

int currentIndex = 3;

class ProfileEditSeller extends StatefulWidget {
  @override
  _ProfileEditSellerState createState() => _ProfileEditSellerState();
}

class _ProfileEditSellerState extends State<ProfileEditSeller> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(31),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Matjar.sign_in_and_sign_up_logo,
                    size: 28,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(padding: EdgeInsets.all(5)),
            CustomTextField(lable: 'First Name'),
            SizedBox(height: 10),
            CustomTextField(lable: 'Last Name'),
            SizedBox(height: 10),
            CustomTextField(lable: 'Email'),
            SizedBox(height: 10),
            CustomTextField(lable: 'Address'),
            SizedBox(height: 10),
            CustomTextField(lable: 'Contact'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomButton(
                text: 'Save',
                vertical: 10,
                horizontal: 20,
              ),
            ),
          ],
        ),
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
            title: Text(
              'Home',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.categories,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Categories',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.cart,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.sign_in_and_sign_up_logo,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
