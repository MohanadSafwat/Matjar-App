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
  final Function fnc;
  Color color;
  CustomButton({@required this.text, this.horizontal, this.vertical,this.fnc, this.color});
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
      onPressed: fnc,
      color: color,

      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String lable;
  Color textColor;
  final TextEditingController control ;
  CustomTextField({@required this.lable, this.control, this.textColor});
  @override
  Widget build(BuildContext context) {
    return TextField(controller: control ,
      style: TextStyle(fontSize: 15, color: textColor),
      decoration: InputDecoration(
        labelText: lable,
        border: InputBorder.none,
        labelStyle: TextStyle(color: textColor),

          

      ),
    );
  }
}
