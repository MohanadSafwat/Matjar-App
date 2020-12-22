import 'package:flutter/material.dart';

var mainColor = Colors.red[700];

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
