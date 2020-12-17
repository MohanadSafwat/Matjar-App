import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'matjar_icons.dart';

import 'Categories.dart';
import 'home.dart';
class Items extends StatefulWidget {
  static String id = 'Items';
  @override
  _ItemsState createState() => _ItemsState();
    }
  
  class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width ;                                                                                             
    return Scaffold(
 appBar: AppBar(
        
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
       // toolbarHeight: 75,
        leading: FlatButton(
          onPressed: () {},
          child: Icon(
            Matjar.keyboard_arrow_left,
            size: 35,
            color: Colors.white,
          ),
        ),
        
        title: Icon(
          Matjar.matjar_logo,
          size: 70,
        ),
        
        actions: [
          SizedBox(
            width: 210,
          ),
          FlatButton(
          onPressed: () {},
          child: Icon(
            Matjar.search_logo,
            size: 35,
            color: Colors.white,)
          ),
        ],
      ),
   
      
      body: Stack(
             children: <Widget>[   
               Positioned.fill(
               child:
                        
//.................................................................................................
               Container(
                 child: ListView.builder(
                     itemBuilder: (context, index) =>
                    index == 0 ?
                     

//...............................................................................................................................
                            Container(
                               height: 60,
                               color: Colors.white,
                               child: Row(
                                 children: <Widget>[
                                     SizedBox(width:width * 0.1 ),
                                   IconButton(
                                     onPressed: (){},
                                     icon: Icon(Matjar.filter,color: Colors.red),
                                      
                                     ),
                                     Text("filter" ,style: TextStyle(fontSize: 20,color: Colors.red)),
                                   SizedBox(width:width * 0.3 ),
                                    IconButton(
                                     onPressed: (){},
                                     icon: Icon(Matjar.sort,color: Colors.red)
                                     ),
                                     Text("sort" ,style: TextStyle(fontSize: 20,color: Colors.red),),
                                     SizedBox(width:width * 0.1),
                                 ],)
                            )
                                                           
                              :
                        Row(
                                          children: <Widget>[
                                             SizedBox(width:width * 0.05),
                                            Padding(
                                             padding: const EdgeInsets.all(5.0),
                                             child: Card(
                                              
                                                  child: SizedBox (width: width * 0.4,height: 300,),
                                                
                                                 
                                              ),
                                           ),

                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Card(
                                                  child: SizedBox (width: width * 0.4,height: 300,),
                                                 
                                                  
                                              ),
                                            ),
                                           ])
                 ),
               )

//...................................................................................................................

                             ,
           ),

           //.....................................................................................................................
            Positioned(
        width: width,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(
           onPressed: (){
             Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => MyHomePage()));
           },
           icon: Icon(Matjar.home ,color: Colors.red,)),

            IconButton(
           onPressed: (){
             Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => Categories()));
           },
           icon: Icon(Matjar.categories ,color: Colors.red,)),

            IconButton(
           onPressed: (){},
           icon: Icon(Matjar.cart ,color: Colors.red,)),

           IconButton(
           onPressed: (){},
           icon: Icon(Matjar.sign_in_and_sign_up_logo ,color: Colors.red,)),
          ]
        ),
              )
      )
   
              ] ) 
      
              );
  }
}

