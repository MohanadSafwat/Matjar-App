//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:matjar_login_signup/actions/constants.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:matjar_login_signup/provider/cartItem.dart';
import 'package:provider/provider.dart';
import 'package:matjar_login_signup/payment.dart';




class SelectedItem extends StatefulWidget {
  static String id ='selected_item';

@override
_SelectedItem createState()=> _SelectedItem();
}

class _SelectedItem extends State<SelectedItem>{
int _quantity =1;
  
  @override
  Widget build(BuildContext context) {
    Item item = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(centerTitle: true,toolbarHeight: 60,backgroundColor: Colors.red,
        title: Text('matjar',style: TextStyle(fontFamily: "DancingScript",),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 215,
              width: 321,
              margin: EdgeInsets.only(top: 18, left: 27, right: 26),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  blurRadius: 1,
                ),
              ]),
            ),
            Container(
              height: 122,
              width: double.infinity,
              margin: EdgeInsets.only(top: 18, left: 27, right: 26),
              //color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Brand',
                            style: TextStyle(
                                color: Colors.blue.withOpacity(1),
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Loreum ipsum Loresm ipsum Loreum',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 11),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              color: Colors.yellow,
                              width: 28,
                              child: Text(
                                '4.5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                '(2000 reviews)',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Text('Egp 4,000'),
                        ),
                      ],
                    ),
                  ),
                  
                  
                  Positioned(
                    height: 25,
                    width: 100,
                    child: Container(
                      color: Colors.blue,
                      child: Builder(
                      builder:(context)=> RaisedButton(
                        onPressed:(){  
                   addToCart(context,item);
                                                  
                           } ,
                          child: Text('Add to Cart',
                                                      style:
                                                          TextStyle(color: Colors.white, fontSize: 12)),
                                                  color: Colors.blue,
                                                ),
                                                ),
                                              ),
                                              bottom: 5,
                                              right: 18,
                                            ),
                                            
                                            

Positioned(
                    height: 25,
                    width: 100,
                    child: Row(

children: <Widget>[
ClipOval(
child: Material(
color: Color.fromRGBO(255, 0, 0, 1),
child: GestureDetector(
onTap: add,
child: SizedBox(
  child: Icon(Icons.add),
height: 28,
width: 28,
),
),
),
),

Text(
_quantity.toString(),
style: TextStyle(
fontSize: 25),
),

ClipOval(
child: Material(
color: Color.fromRGBO(255, 0, 0, 1),
child: GestureDetector(
onTap: subtract,

child: SizedBox(
  child: Icon(Icons.remove),
height: 28,
width: 28,
),
),
),
),

],


                    ),
                                              bottom: 80,
                                              right: 18,
                                            ),





                                            Positioned(
                                              height: 25,
                                              width: 100,
                                              child: Container(
                                                color: Colors.red,
                                                child: RaisedButton(
                                                  onPressed: () => Navigator.of(context).pushNamed('/payment'),
                                                  child: Text('Buy Now',
                                                      style:
                                                          TextStyle(color: Colors.white, fontSize: 12)),
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              bottom: 40,
                                              right: 18,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 215,
                                          width: 321,
                                          margin: EdgeInsets.only(top: 18, left: 27, right: 26),
                                          decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              blurRadius: 1,
                                            ),
                                          ]),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Spesc',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: 15),
                                                ),
                                                margin: EdgeInsets.only(
                                                  left: 13,
                                                  top: 13,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        left: 13,
                                                        top: 10,
                                                      ),
                                                      height: 25,
                                                      width: 90,
                                                      decoration:
                                                          BoxDecoration(color: Colors.white, boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(1),
                                                          blurRadius: 10,
                                                        ),
                                                      ])),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 13,
                                                      top: 10,
                                                    ),
                                                    height: 25,
                                                    width: 165,
                                                    decoration:
                                                        BoxDecoration(color: Colors.white, boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(1),
                                                        blurRadius: 10,
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        left: 13,
                                                        top: 10,
                                                      ),
                                                      height: 25,
                                                      width: 90,
                                                      decoration:
                                                          BoxDecoration(color: Colors.white, boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(1),
                                                          blurRadius: 10,
                                                        ),
                                                      ])),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 13,
                                                      top: 10,
                                                    ),
                                                    height: 25,
                                                    width: 165,
                                                    decoration:
                                                        BoxDecoration(color: Colors.white, boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(1),
                                                        blurRadius: 10,
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                        left: 13,
                                                        top: 10,
                                                      ),
                                                      height: 25,
                                                      width: 90,
                                                      decoration:
                                                          BoxDecoration(color: Colors.white, boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(1),
                                                          blurRadius: 10,
                                                        ),
                                                      ])),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 13,
                                                      top: 10,
                                                    ),
                                                    height: 25,
                                                    width: 165,
                                                    decoration:
                                                        BoxDecoration(color: Colors.white, boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(1),
                                                        blurRadius: 10,
                                                      ),
                                                    ]),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }
                          
  
  void addToCart(context,item) {

cartItem cartitem=  Provider.of<cartItem>(context,listen: false);
 // item.itemQuantity=_quantity;
var itemsInCart=cartitem.items;
bool exist =false;
for(var itemsInCart in itemsInCart){

if(itemsInCart==item)
{

exist=true;
}

}

if(exist){
Scaffold.of(context).showSnackBar(SnackBar(
  content: Text('Already Added to Cart'),
  ));

}

else{
cartitem.addItem(item);
Scaffold.of(context).showSnackBar(SnackBar(
  content: Text('Added to Cart'),
  ));
}

}

   subtract() {
if(_quantity>1){
  setState(() {
   _quantity--;  
  });
 }

  }

  add() {

setState(() {
  _quantity++;
});

  }






}
