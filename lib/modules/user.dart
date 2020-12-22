import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Userinit {
  final String uid;

  Userinit({this.uid});
}

class UserData {
  final String uid;
  final String firstName;
  final String lastName;
  final String currency;
  final String address;
  final String email;
  final String contact;
  final bool darkmode;
  final bool isSeller;

  UserData({
    this.email,
    this.uid,
    this.firstName,
    this.lastName,
    this.currency,
    this.contact,
    this.address,
    this.darkmode,
    this.isSeller,
  });
}
