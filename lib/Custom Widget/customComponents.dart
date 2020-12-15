import 'package:flutter/material.dart';
import 'package:matjar_login_signup/matjar_icons.dart';
import 'package:matjar_login_signup/matjar_icons1.dart';
import '../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(75);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final double vertical, horizontal;
  CustomButton({@required this.text, this.horizontal, this.vertical});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onPressed: () {},
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String lable;
  CustomTextField({@required this.lable});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
