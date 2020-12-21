import 'package:flutter/material.dart';
import 'package:matjar_login_signup/constants.dart';
import 'package:matjar_login_signup/payment.dart';
import 'constants.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:matjar_login_signup/provider/cartItem.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';



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
    if(true
    ///////////////items.isNotEmpty
    )
    {
return
 Column(
children : <Widget>[



  
  
   Expanded(
child:ListView.builder(itemBuilder:
(context,index)
{

return Padding(padding: const EdgeInsets.all(15),
child: Container(

height: screenHeight*0.15,
child: Row(children:<Widget> [
CircleAvatar(
radius: screenHeight*0.15/2,
backgroundColor: Colors.red,//////////backgroundImage: AssetImage(items[index].photosUrl[index]),

),
Expanded(

child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Padding(padding: const EdgeInsets.all(3),
child:Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[

Text ('Item name'/////items[index].name
 ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),

Text ('Item Category'/////items[index].categoryName
 ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
),
Padding(padding: const EdgeInsets.all(7),
child: Text ('Item Price'/////  '\$ $(items[index].price)'
 ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
)
),
],

)
),
Padding(padding:const EdgeInsets.only(right:15),
child:Text ('Item quantity',
/////////////items[index].itemQuantity.toString()
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

);
},

itemCount: 15 ,//////items.length,
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
child: Text('Buy Now '.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

color:Colors.red,

),
)

],

);
  }
  
  else{
return  Center(
child: Text('Cart is Empty',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),

);
}
    }
    ),

    );
    
  }
}
