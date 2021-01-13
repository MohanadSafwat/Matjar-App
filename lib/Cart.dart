import 'package:flutter/material.dart';
import 'package:matjar_login_signup/constants.dart';
import 'package:matjar_login_signup/payment.dart';
import 'package:matjar_login_signup/selected_item.dart';
import 'constants.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:matjar_login_signup/cartItem.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';
import 'package:matjar_login_signup/custom_menu.dart';


class Cart extends StatelessWidget {
  static String id = 'Cart';
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    
List<Item> items= Provider.of<cartItem>(context).items;
final double screenHeight=MediaQuery.of(context).size.height;
final double screenwidth=MediaQuery.of(context).size.width;

    return Scaffold(
backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Matjar",
          style: TextStyle(
            fontSize: 40,
            fontFamily: "DancingScript",
          ),
        ),
        backgroundColor: mainColor,
        toolbarHeight: 80,
        centerTitle: true,
      ),
bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 13,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.home,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.categories,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.cart,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Matjar.sign_in_and_sign_up_logo,
              color: Color.fromRGBO(255, 0, 0, 1),
            ),
            label: "",
          ),
        ],
        /* onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }, */
      ),




 body:LayoutBuilder(
  builder:(context,constrains){
    if(items.isNotEmpty)
    {
return Column(
children : <Widget>[

 Expanded(
child:ListView.builder(itemBuilder:
(context,index)
{

return Padding(
  padding: const EdgeInsets.all(15),
child: GestureDetector(
onTapUp: (details){
showCustomMenu(details,context,items[index]);

},

  child:   Container(
  
  
  
  height: screenHeight*0.15,
  
  child: Row(children:<Widget> [
  
  CircleAvatar(
  
  radius: screenHeight*0.15/2,
  
  backgroundImage: AssetImage(items[index].photosUrl[index]),
  
  
  
  ),
  
  Expanded(
  
  
  
  child:Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  children: <Widget>[
  
  Padding(padding: const EdgeInsets.all(3),
  
  child:Column(
  
  mainAxisAlignment: MainAxisAlignment.center,
  
  children: <Widget>[
  
  
  
  Text (items[index].name
  
   ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  
  ),
  
  
  
  Text (items[index].categoryName
  
   ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
  
  ),
  
  Padding(padding: const EdgeInsets.all(7),
  
  child: Text ( '\$ ${items[index].price}'
  
   ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  
  )
  
  ),
  
  ],
  
  
  
  )
  
  ),
  
  Padding(padding:const EdgeInsets.only(right:15),
  
  child:Text (items[index].itemQuantity.toString(),
  
  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
  
  )
  
  )
  
  ],
  
  
  
  
  
  
  
  )
  
  )
  
  ],
  
  
  
  
  
  ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  color: Colors.white,
  
  ),
),

);
},

itemCount: items.length,
),
),
  

















ButtonTheme(
  minWidth: screenwidth,
child:RaisedButton(
  shape: RoundedRectangleBorder(

borderRadius: BorderRadius.only(
topRight: Radius.circular(10),
topLeft: Radius.circular(10),
)
),
  
  onPressed: ()
{
  Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => Payment()));


},
child: Text('Order Now '.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

color:Colors.red,

),
)

],

);
  }
  
  else{
return  Center(
child: Text('Your Cart is Empty',style: TextStyle(fontSize: 30,color:Colors.red,fontWeight: FontWeight.bold)),

);
}
    }
    ),

    );
    
  }

  void showCustomMenu(details,context,item) async {
double dx = details.globalPosition.dx;
double dy = details.globalPosition.dy;
double dx2= MediaQuery.of(context).size.width-dx;
double dy2= MediaQuery.of(context).size.width-dy;

await showMenu(

context: context,
position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
items: [
MyPopupMenuItem(
onClick:(){
Navigator.pop(context);
Provider.of<cartItem>(context,listen: false).deleteItem(item);
Navigator.pushNamed(context, SelectedItem.id,arguments: item);
},
child: Text('Edit'),
),

MyPopupMenuItem(
onClick:(){
Navigator.pop(context);
Provider.of<cartItem>(context,listen: false).deleteItem(item);
},

child: Text('Delete'),
),
]
);}







}
