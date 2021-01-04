import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../modules/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  Future userSetup(String firstName, String lastName, String email,
      String address, String contact, String currency) async {
    return await users.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'currency': currency,
      'address': address,
      'email': email,
      'contact': contact,
    });
  }

  Future userEdit(String firstName, String lastName, String address,
      String contact, String currency) async {
    return await users.doc(uid).update({
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'currency': currency,
      'address': address,
      'contact': contact,
    });
  }

  Future isSellerSetup(bool isSeller) async {
    return await users.doc(uid).update({
      'isSeller': isSeller,
    });
  }

  Future darkmodeSetup(bool darkmode) async {
    return await users.doc(uid).update({
      'darkmode': darkmode,
    });
  }

  Account _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Account(
      uid: uid,
      firstName: snapshot.data()['firstName'],
      lastName: snapshot.data()['lastName'],
      address: snapshot.data()['address'],
      email: snapshot.data()['email'],
      currency: snapshot.data()['currency'],
      contact: snapshot.data()['contact'],
      darkmode: snapshot.data()['darkmode'],
      isSeller: snapshot.data()['isSeller'],
    );
  }

  // get user doc stream
  Stream<Account> get userData {
    return users.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
