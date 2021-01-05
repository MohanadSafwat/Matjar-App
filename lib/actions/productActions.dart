import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:permission_handler/permission_handler.dart';
import './constants.dart';

var photoUrl;

class ProductAction {
  // Item item;

  // FirebaseFirestore firestore = FirebaseFirestore.instance.collection('mobiles');
  // ProductAction(this.item);
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('Categories');
  Future<void> addProduct(Item item, String itemId) {
    addProductIdToSeller(itemId, item.categoryName, item.sellerId);
    return firestore
        .doc(item.categoryName)
        .collection('items')
        .doc(itemId)
        .set({
          itemName: item.name,
          itemPrice: item.price,
          itemBrand: item.brand,
          noOfItemsInStock: item.numberInStock,
          itemPhotoUrl: photoUrl,
          itemSpecs: item.specs,
          itemSellerId: item.sellerId,
        })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
}

// List<Map<String,String>>SellerItems=[];
var sellerItem = <Map>[];
Future<void> addProductIdToSeller(
    String itemId, String itemCategoryName, String sellerId) {
  CollectionReference firestore2 =
      FirebaseFirestore.instance.collection("sellers");
  var map = {};
  map = {'itemCategoryName': itemCategoryName, 'itemId': itemId};
  sellerItem.add(map);
  return firestore2.doc(sellerId).set({
    'items': FieldValue.arrayUnion(sellerItem),
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  });
}

Future<String> uploadImage() async {
  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();

  //Check Permissions
  await Permission.photos.request();

  var permissionStatus = await Permission.photos.status;

  if (permissionStatus.isGranted) {
    //Select Image
    final image = await _picker.getImage(source: ImageSource.gallery);
    final file = File(image.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot = await _storage.ref().child('itemPhotos').putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();
      photoUrl = downloadUrl;
    } else {
      print('No Path Received');
    }
  } else {
    print('Grant Permissions and try again');
  }
}

int count;
counter() async {
  await FirebaseFirestore.instance
      .collection('variable')
      .doc('itemIdCounter')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      count = documentSnapshot.data()['counter'];
    } else {
      print('Document does not exist on the database');
    }
  });
}

int getCounter() {
  return count;
}

addCounter(int counterPlused) async {
  await counterPlused++;
  FirebaseFirestore.instance
      .collection('variable')
      .doc('itemIdCounter')
      .set({'counter': counterPlused});
}

String userID;
getSellerId() async {
  final FirebaseAuth auth = await FirebaseAuth.instance;
  final User seller = auth.currentUser;
  final uid = seller.uid;
  userID = uid;
}

String sendID() {
  return userID;
}

List productId = [];
Future getSellerProductId(String id) async {
  try {
    await FirebaseFirestore.instance
        .collection("sellers")
        .doc(id)
        .get()
        .then((documentsnapshot) {
      productId = documentsnapshot.data()["items"];
    });
  
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future getSellerProducts() async {
  List products = [];
  getSellerId();
  getSellerProductId(sendID());
  CollectionReference firestore2 =
      FirebaseFirestore.instance.collection("products");
for (var item in productId) {
    await firestore2.doc(item["itemId"]).get().then((documentsnapshot) {
      products.add(documentsnapshot.data());
    });
    return products;
  }

}
