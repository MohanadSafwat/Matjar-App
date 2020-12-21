import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:matjar_login_signup/constants.dart';
import 'package:matjar_login_signup/home.dart';
import 'matjar_icons.dart';
import 'constants.dart';
import 'package:matjar_login_signup/provider/cartItem.dart';
import 'package:matjar_login_signup/modules/item.dart';
import 'package:provider/provider.dart';


class Payment extends StatefulWidget {
  static String id ='Payment';
  
  @override
  _PaymentState createState() => _PaymentState();
}

enum payment_method { credit, cash }
enum payment_currency { dollar, euro, pound }

class _PaymentState extends State<Payment> {
  payment_method _method = payment_method.credit;
payment_currency _currency = payment_currency.dollar;

  final TextEditingController _nameOnCard = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _validThrough = TextEditingController();
int currentIndex = 3;

int selectedRadio;
var nameoncard=null;
var cardnumber=null;
var cvv=null;
var valid=null;

double finalPrise=0;
double priseineuro=0;
double priseindollar=0;
double priseinpound=0;

  int currencyChosen=0;


@override
void initState(){
super.initState();
selectedRadio=0;
}

setSelectedRadio(int val){
setState(() {
  selectedRadio=val;
});

}

  @override
  Widget build(BuildContext context) {
    List<Item> items= Provider.of<cartItem>(context).items;
 

for(int i=0;i<items.length;i++){
finalPrise+= items[i].price*items[i].itemQuantity;
}
priseineuro=(finalPrise/20) ;
priseindollar=(finalPrise/15) ;
priseinpound=(finalPrise/1) ;


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: ""),
        ],
        backgroundColor: Colors.red,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        //selectedIconTheme: IconThemeData(color: Colors.blue),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.red,
      resizeToAvoidBottomPadding: true,
body: ListView(     
      children:<Widget> [

  AppBar(
        title: Text(
          'matgar',
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
      body: Column(

      
     
     
       Column(
        children: [
          ListTile(
            title: Text('Buy throw credit card'),
            leading: Radio(
              value: payment_method.credit,
              groupValue: _method,
              activeColor: Colors.red,
              onChanged: (payment_method value) {
                setState(() {
                  _method = value;
                  
                });
              },
            ),
@ -67,6 +115,7 @@ class _PaymentState extends State<Payment> {
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Name on card',
                      border: OutlineInputBorder(),
@ -77,6 +126,7 @@ class _PaymentState extends State<Payment> {
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
@ -91,6 +141,7 @@ class _PaymentState extends State<Payment> {
                      padding: EdgeInsets.only(bottom: 10),
                      width: 130,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'valid',
                          border: OutlineInputBorder(),
@ -103,6 +154,7 @@ class _PaymentState extends State<Payment> {
                      padding: EdgeInsets.only(bottom: 10),
                      width: 110,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'cvv',
                          border: OutlineInputBorder(),
@ -120,6 +172,7 @@ class _PaymentState extends State<Payment> {
            leading: Radio(
              value: payment_method.cash,
              groupValue: _method,
              activeColor: Colors.red,
              onChanged: (payment_method value) {
                setState(() {
                  _method = value;
@ -132,23 +185,154 @@ class _PaymentState extends State<Payment> {
            padding: EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'where you want to pick up',
                labelText: 'where do you want to pick up',
                border: OutlineInputBorder(),
              ),
              controller: _cvv,
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(left: 38, right: 40),
            padding: EdgeInsets.only(bottom: 10),
          child:Column(

children:<Widget> [
Row(
 children:<Widget> [ 
 Radio(
              value: 1,
              groupValue: selectedRadio,
              activeColor: Colors.red,
              onChanged: ( currencyChosed) {
                currencyChosen=currencyChosed;
                setSelectedRadio(currencyChosed);
              },
            ),
          


Text('Price in euros: e$priseineuro',style: TextStyle(fontSize: 20,color: Colors.black),),
 
 ],
),


Row(
 children:<Widget> [ 
 Radio(
              value: 2,
              groupValue: selectedRadio,
              activeColor: Colors.red,
              onChanged: ( currencyChosed) {
                currencyChosen=currencyChosed;
                setSelectedRadio(currencyChosed);
              print(currencyChosed);
              },
            ),
          


Text('Price in Pound: $priseinpound L.E',style: TextStyle(fontSize: 20,color: Colors.black),),
 
 ],
),

Row(
 children:<Widget> [ 
 Radio(
              value: 3,
              groupValue: selectedRadio,
              activeColor: Colors.red,
              onChanged: ( currencyChosed) {
                currencyChosen=currencyChosed;
                setSelectedRadio(currencyChosed);
                 print(currencyChosed);
              },
     
            ),
          


Text('Price in dollars: \$ $priseindollar',style: TextStyle(fontSize: 20,color: Colors.black),),
 
 ],
)

],


          )
          ),
          
          
          
          
          
          
          
          
          
          Container(
            margin: EdgeInsets.only(left:190),
            width: 100,
            child: RaisedButton(
                child: Text('Purshe',style: TextStyle(color: Colors.white),),
                onPressed: (){print('1');},
            child: Builder(
                      builder:
                      (context)=>RaisedButton(
                child: Text('PURCHASE',style: TextStyle(fontSize: 13,color: Colors.white),),
                onPressed: ()
                async{
setState(() {
  nameoncard=_nameOnCard.text;
cvv=_cvv.text;
valid=_validThrough.text;
cardnumber=_cardNumber.text;

});

if(cvv.toString().isEmpty||currencyChosen==0||valid.toString().isEmpty||nameoncard.toString().isEmpty||cardnumber.toString().isEmpty
  )
  
  {   
   Scaffold.of(context).showSnackBar(SnackBar(
  content: Text('Please Complete the requirments'),));
   
   
}      
else{
print(cvv);
Scaffold.of(context).showSnackBar(SnackBar(
  content: Text('Purchased Successfully'),));
deleteItems( context,items);//////////remove items from cartscreen
await Future.delayed(Duration(seconds: 2));
Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
}


                  },
                
                color: Colors.red)
                color: Colors.red),
                )
          )
        ],
      ),
      ],
      scrollDirection: Axis.vertical,
),
   
    );
  
  }





  void deleteItems(BuildContext context, List<Item> items) {
cartItem cartitem=  Provider.of<cartItem>(context,listen: false);
cartitem.removeItems(items);
}



}
