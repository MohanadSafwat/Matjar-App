import 'package:flutter/material.dart';
import 'package:matjar_login_signup/matjar_icons.dart';
import 'package:matjar_login_signup/matjar_icons1.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(75);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(255, 0, 0, 1),
      toolbarHeight: 75,
      leading: FlatButton(
        onPressed: () {},
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
