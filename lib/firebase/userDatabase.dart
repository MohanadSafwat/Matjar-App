import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../modules/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference sellersID =
      FirebaseFirestore.instance.collection('sellers');

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
      'offer': 1,
      'recent': [],
      'recommended': {
        'Electronics': 0,
        'Mobiles': 0,
        'Kitchen Tools': 0,
        'Fashion': 0
      }
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

  Future sellerID() async {
    return await sellersID.doc(uid).set({
      'uid': uid,
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
      offer: snapshot.data()['offer'],
      recent: snapshot.data()['recent'],
      recommended: snapshot.data()['recommended'],
    );
  }

  // get user doc stream
  Stream<Account> get userData {
    return users.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future offerUpdate({offer}) async {
    return await users
        .doc(uid)
        .update({'offer': (offer == 10) ? offer : (offer + 1)});
  }

  Future searchUpdate({searchList, searchItem}) async {
    if (searchList.length < 10) {
      if (searchList.contains(searchItem)) {
        searchList.remove(searchItem);
        searchList = [searchItem, ...?searchList];
      } else {
        searchList = [searchItem, ...?searchList];
      }
    } else {
      if (searchList.contains(searchItem)) {
        searchList.remove(searchItem);
        searchList = [searchItem, ...?searchList.sublist(0, 9)];
      } else {
        searchList = [searchItem, ...?searchList.sublist(0, 9)];
      }
    }
    return await users.doc(uid).update({'recent': searchList});
  }

  Future recommendedUpdate({String cat, int count, rec}) async {
    rec[cat] = count + 1;
    return await users.doc(uid).update({'recommended': rec});
  }

  String getMaxCat({rec}) {
    List x = rec.values.toList()..sort();
    String maxName =
        rec.keys.firstWhere((k) => rec[k] == x[3], orElse: () => null);
    return maxName;
  }
}

/* 



 /* Seller */

  Future sellerSetup(String firstName, String lastName, String email,
      String address, String contact, String currency) async {
    return await sellersAcc.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'currency': currency,
      'address': address,
      'email': email,
      'contact': contact,
    });
  }

  Future sellerEdit(String firstName, String lastName, String address,
      String contact, String currency) async {
    return await sellersAcc.doc(uid).update({
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'currency': currency,
      'address': address,
      'contact': contact,
    });
  }

  Future isSellerSellerSetup(bool isSeller) async {
    return await sellersAcc.doc(uid).update({
      'isSeller': isSeller,
    });
  }

  Future darkmodeSellerSetup(bool darkmode) async {
    return await sellersAcc.doc(uid).update({
      'darkmode': darkmode,
    });
  }
 */
