import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matjar_login_signup/modules/item.dart';
import './constants.dart';
class ProductAction{
 // FirebaseFirestore firestore = FirebaseFirestore.instance.collection('mobiles');

CollectionReference firestore = FirebaseFirestore.instance.collection('Category');

 Future<void>addProduct({Item item} ){
  return firestore.doc(item.categoryName).collection('items').doc('2').set({
    itemName : item.name,
    itemPrice :item.price,
    itemBrand:item.brand,
    noOfItemsInStock:item.numberInStock,
     });
}
}