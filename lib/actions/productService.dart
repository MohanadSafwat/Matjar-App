import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matjar_login_signup/modules/item.dart';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // CollectionReference _productReference = FirebaseFirestore.instance.collection('Categories').doc('mobiles').collection('items');
  CollectionReference _productReference =
      FirebaseFirestore.instance.collection('products');

  // Future <List> featuredItems() async{
  //   List<Map<String,String>> itemList = new List();
  //   Random rdn = new Random();
  //   int randomNumber = 1 + rdn.nextInt(4);
  //   QuerySnapshot itemsRef = await _productReference.orderBy('itemName').startAt([randomNumber]).limit(20).get();
  //   for(DocumentSnapshot docRef in itemsRef.docs){
  //     Map<String,String> items = new Map();
  //     items['photoUrl'] = docRef['photoUrl'];
  //     items['itemName'] = docRef['itemName'];
  //     items['itemPrice'] = docRef['itemPrice'].toString();
  //     items['offer'] = (docRef['itemPrice'] *((100 - docRef['offer']) / 100)).toString();
  //     items['productId'] = docRef.documentID;
  //     itemList.add(items);
  //   }
  //   return itemList;
  // }
  Future<List> featuredItems() async {
    // List<Map<String, String>> itemList = new List();
    List<Item> itemGet = [];
    Random rdn = new Random();
    int randomNumber = 1 + rdn.nextInt(4);
    QuerySnapshot itemsRef = await _productReference
        .orderBy('itemName')
        .startAt([randomNumber])
        .limit(5)
        .get();
    for (DocumentSnapshot docRef in itemsRef.docs) {
      itemGet.add(Item(
          brand: docRef['itemBrand'],
          name: docRef['itemName'],
          price: double.parse(docRef['itemPrice'].toString()),
          sellerId: docRef['itemSellerId'],
          specs: docRef['itemSpecs'],
          numberInStock: docRef['noOfItemsInStock'],
          url: docRef['photoUrl'],
          // reviews: (docRef['itemReviews'] == null ) ? null : docRef['itemReviews'],
          categoryName: docRef['itemCategoryName'],
          reviews:
              (docRef['itemReviews'] == null) ? null : docRef['itemReviews'],
          rate: (docRef['rate'] == null)
              ? null
              : double.parse(docRef['rate'].toString()),
          id: docRef.id));
    }
    return itemGet;
  }

  Stream<QuerySnapshot> offeredItems() {
    Random rdn = new Random();
    int randomNumber = 1 + rdn.nextInt(4);
    return _firestore
        .collection('products')
        .orderBy('itemName')
        .startAt([randomNumber])
        .limit(5)
        .snapshots();
  }

  Future<Map> particularItem(String productId) async {
    DocumentSnapshot prodRef =
        await _productReference.document(productId).get();
    Map<String, dynamic> itemDetail = new Map();
    itemDetail['image'] = prodRef['image'][0];
    itemDetail['color'] = prodRef['color'];
    itemDetail['size'] = prodRef['size'];
    itemDetail['price'] = prodRef['price'];
    itemDetail['name'] = prodRef['name'];
    itemDetail['productId'] = productId;
    return itemDetail;
  }

  Stream<QuerySnapshot> loadSearch() {
    return _firestore.collection('products').snapshots();
  }

  Stream<QuerySnapshot> loadCat(String cat) {
    return _firestore
        .collection('Categories')
        .doc(cat)
        .collection('items')
        .snapshots();
  }
}
