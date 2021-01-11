import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/modules/user.dart';
import 'package:permission_handler/permission_handler.dart';
import './constants.dart';

var photoUrl;

class ProductAction {
  // Item item;

  // FirebaseFirestore firestore = FirebaseFirestore.instance.collection('mobiles');
  // ProductAction(this.item);
  CollectionReference firestoreCategories =
      FirebaseFirestore.instance.collection('Categories');
  Future<void> addProductToCategories(Item item, String itemId) {
    addProductToProducts(item, itemId);
    addProductIdToSeller(itemId, item.categoryName, item.sellerId);
    return firestoreCategories
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
          'itemCategoryName': item.categoryName,
          'rate': 0
        })
        .then((value) => print("Product Added to category"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  CollectionReference firestoreProducts =
      FirebaseFirestore.instance.collection('products');
  Future<void> addProductToProducts(Item item, String itemId) {
    return firestoreProducts
        .doc(itemId)
        .set({
          itemName: item.name,
          itemPrice: item.price,
          itemBrand: item.brand,
          noOfItemsInStock: item.numberInStock,
          itemPhotoUrl: photoUrl,
          itemSpecs: item.specs,
          itemSellerId: item.sellerId,
          'itemCategoryName': item.categoryName,
          'rate': 0,
          'itemReviews': FieldValue.arrayUnion([]),

    })
        .then((value) => print("Product Added to products"))
        .catchError((error) => print("Failed to add product: $error"));
  }
}
var cartItems =<Map>[];
Future<void> addProductToCart(Item item, String userId) {
  CollectionReference user =FirebaseFirestore.instance.collection('Users');
  var map = {};
  map = {'itemCategoryName': item.categoryName, 'itemId': item.id, 'itemPrice':item.price,
    'itemUrl':item.url, 'itemName':item.name
  };
  cartItems.add(map);
  return user.doc(userId).update({
    'cartItems': FieldValue.arrayUnion(cartItems),
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  }).then((value) => print('add product to cart'));
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
  return firestore2.doc('3Nd2P2oDZDUdOuLqLYYewwH6jDs2').update({
    'items': FieldValue.arrayUnion(sellerItem),
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  }).then((value) => print('add to seller'));
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

getUrl() {
  return photoUrl;
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

getUserId() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;
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
        .doc('3Nd2P2oDZDUdOuLqLYYewwH6jDs2')
        .get()
        .then((documentsnapshot) {
      productId = documentsnapshot.data()["items"];
    });
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Stream<DocumentSnapshot> Product(String id) {
  CollectionReference firebase =
      FirebaseFirestore.instance.collection('products');
  return firebase.doc(id).snapshots();
}

Future getSellerProducts() async {
  List products = [];
  getSellerId();
  await getSellerProductId('3Nd2P2oDZDUdOuLqLYYewwH6jDs2');
  CollectionReference firestore2 =
      FirebaseFirestore.instance.collection("products");

  for (var item in productId) {
    await firestore2.doc(item["itemId"]).get().then((documentsnapshot) {
      products.add(documentsnapshot.data());
    });
  }
  return products;
}

addReviewToProducts(
    Map<String, dynamic> info, String itemId, String comment, double rate) {
  CollectionReference firestore2 =
      FirebaseFirestore.instance.collection("products");
  var map = {};
  map = {
    'firstName': info['firstName'],
    'lastName': info['lastName'],
    'comment': comment,
    'noOfStars': rate
  };
  sellerItem.add(map);
  return firestore2.doc(itemId).update({
    'itemReviews': FieldValue.arrayUnion(sellerItem),
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  }).then((value) => print('add review to products'));
}

addReviewToCategories(Map<String, dynamic> info, String itemId, String comment,
    double rate, String categoryName) {
  addReviewToProducts(info, itemId, comment, rate);
  CollectionReference firestore3 = FirebaseFirestore.instance
      .collection("Categories")
      .doc(categoryName)
      .collection('items');

  return firestore3.doc(itemId).update({
    'itemReviews': FieldValue.arrayUnion(sellerItem),
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  }).then((value) => print('add review to category'));
}

upateRateOnProducts(double rate, String itemId) {
  CollectionReference firestore4 =
      FirebaseFirestore.instance.collection("products");
  print('done 1');

  return firestore4.doc(itemId).update({
    'rate': rate,
    // :FieldValue.arrayUnion(itemCategoryName),
    //
  }).then((value) => print('update rate to products'));
}

upateRateOnCategories(double rate, String itemId, String categoryName) {
  upateRateOnProducts(rate, itemId);
  print('done 2');
  CollectionReference firestore3 = FirebaseFirestore.instance
      .collection("Categories")
      .doc(categoryName)
      .collection('items');
  return firestore3.doc(itemId).update({
    'rate': rate,
  }).then((value) => print('update rate to category'));
}
