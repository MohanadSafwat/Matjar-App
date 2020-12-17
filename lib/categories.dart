import 'package:flutter/material.dart' ;
import 'matjar_icons.dart';

import 'home.dart';

class Categories extends StatefulWidget {
  static String id = 'Categories';
  @override
  _CategoriesState createState() => _CategoriesState();
    }
  
  class _CategoriesState extends State<Categories> {
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
         
        ],
      ),
                body:   Stack(
                 children: <Widget>[  Positioned.fill( child : Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                             //................................................
//................................................................................................
                   SizedBox( height:100),
                   Row(
                      children: <Widget>[
                          SizedBox (width:  width * 0.07,) ,
                         Icon(Matjar.categories,color: Colors.black,),
                           SizedBox (width:  width * 0.05,) ,
                          Text("Categories",style: TextStyle(fontSize: 30,),),
                      ]
                   ),
                    SizedBox (height: 10,) ,
//....................................................................................
 Padding(
                 padding: const EdgeInsets.all(20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
        child: SizedBox (width:  width * 0.4,height: 120,) ,
        ),
       
        
                    Card(
        child: SizedBox (width:  width * 0.4,height: 120,) ,
        ),

                    ],
                  ),
               ),

                Padding(
                 padding: const EdgeInsets.all(20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
        child: SizedBox (width:  width * 0.4,height: 120,) ,
        ),
       
        
                    Card(
        child: SizedBox (width:  width * 0.4,height: 120,) ,
        ),

                    ],
                  ),
               ), 
                             ])),
               //.......................................................................................................
              
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
                 
               


                             ])
                    ) ;
  }

  }