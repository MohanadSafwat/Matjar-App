import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _productReference = FirebaseFirestore.instance.collection('Categories').doc('mobiles').collection('items');



  
  Future <List> featuredItems() async{
    List<Map<String,String>> itemList = new List();
    Random rdn = new Random();
    int randomNumber = 1 + rdn.nextInt(4);
    QuerySnapshot itemsRef = await _productReference.orderBy('itemName').startAt([randomNumber]).limit(20).get();
    for(DocumentSnapshot docRef in itemsRef.docs){
      Map<String,String> items = new Map();
      items['photoUrl'] = docRef['photoUrl'];
      items['itemName'] = docRef['itemName'];
      items['itemPrice'] = docRef['itemPrice'].toString();
      items['offer'] = (docRef['itemPrice'] *((100 - docRef['offer']) / 100)).toString();
      items['productId'] = docRef.documentID;
      itemList.add(items);
    }
    return itemList;
  }

  Future <List> offeredItems() async{
    List<Map<String,String>> itemList = new List();
    QuerySnapshot itemsRef = await _productReference.limit(10).get();
    for(DocumentSnapshot docRef in itemsRef.docs){
      Map<String,String> items = new Map();
      items['photoUrl'] = docRef['photoUrl'];
      items['itemName'] = docRef['itemName'];
      items['itemPrice'] = docRef['itemPrice'].toString();

      items['productId'] = docRef.documentID;
      itemList.add(items);
    }
    return itemList;
  }

  Future<Map> particularItem(String productId) async{
    DocumentSnapshot prodRef = await _productReference.document(productId).get();
    Map<String, dynamic> itemDetail = new Map();
    itemDetail['image'] = prodRef['image'][0];
    itemDetail['color'] = prodRef['color'];
    itemDetail['size'] = prodRef['size'];
    itemDetail['price'] = prodRef['price'];
    itemDetail['name'] = prodRef['name'];
    itemDetail['productId'] = productId;
    return itemDetail;
  }
}
