
import 'package:flutter/cupertino.dart';
import 'package:matjar_login_signup/modules/item.dart';

class cartItem extends ChangeNotifier {

List<Item> items=[];

addItem(Item item){

items.add(item);
notifyListeners();

}

removeItems(List<Item> items){

for(int i=0;i<items.length;i++){
items.remove(items[i]);
}
notifyListeners();

}


deleteItem( Item item)
{
items.remove(item);
notifyListeners();
}



}





