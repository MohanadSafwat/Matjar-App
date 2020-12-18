import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matjar_login_signup/profile.dart';
import 'package:matjar_login_signup/sellerDashboard.dart';
import 'matjar_icons.dart';
import 'Categories.dart';

class MyHomePage extends StatefulWidget {
 
  static String id = 'MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width ;
    return Scaffold(
       appBar: AppBar(
        
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
       // toolbarHeight: 75,
      
        
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
   
      body: Stack(
             children: <Widget>[   Positioned.fill(
                            child: ListView( children: <Widget>[
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
                //........................................................................................
                Container(
                  height: 100,
                  color: Color.fromRGBO(255, 0, 0, 1),
                 child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
             
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    
                    decoration:InputDecoration(
                      filled: true,
                      fillColor  : Colors.white,
                      hoverColor: Colors.white ,
                      focusColor:Colors.white ,
                     prefixIcon: Icon(
                  Matjar.search_logo,
                  )
                      ,enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                     borderSide: BorderSide(color: Colors.white)
                    ),
            focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white)),
                      hintText: "Search"
                    )
                   
                  ),
                )
            ]
            )
                  ),

                  //.................................................................................
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text("Recommended",style: TextStyle(fontSize: 20,)),
              margin: EdgeInsets.only(left: 25),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                  height: 200,
                  child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                    
                    itemBuilder: (context, index) =>Padding(
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Card(
              child: SizedBox (width: width * 0.3,),
              margin: EdgeInsets.only(right:5),
          ),
        
         ),
                  ),
              ),
            ),
            //.....................................................................................
             Container(
              padding: const EdgeInsets.all(10.0),
              child: Text("Categories",style: TextStyle(fontSize: 20,)),
              margin: EdgeInsets.only(left: 25),
            ),
                Padding(
                 padding: const EdgeInsets.all(20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
        child: SizedBox (width:  width * 0.4,height: 150,) ,
        ),
       
        
                    Card(
        child: SizedBox (width:  width * 0.4,height: 150,) ,
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
        child: SizedBox (width:  width * 0.4,height: 150,) ,
          
        ),
       
        
                    Card(
        child: SizedBox (width:  width * 0.4,height: 150,) ,
          
        ),

                    ],
                  ),
               ),

               Container(
              padding: const EdgeInsets.all(10.0),
              child: Text("Offers",style: TextStyle(fontSize: 20,)),
              margin: EdgeInsets.only(left: 25),
            ),
               Padding(
                 padding: const EdgeInsets.all(25),
                 child: Container(
                  height: 200,
                  child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                    
                    itemBuilder: (context, index) =>Padding(
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Card(
            child: SizedBox (width: 120,),
            margin: EdgeInsets.only(right:5),
          ),
        
         ),
                  ),
            ),
               ),

               ]
            ) ,  
        
    ]
        ),
             ),
       //..................................................................................................................
      Positioned(
        width: width,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           IconButton(
           onPressed: (){},
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
           onPressed: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => SellerDashboard()));
           },
           icon: Icon(Matjar.sign_in_and_sign_up_logo ,color: Colors.red,)),
          ]
        ),
              )
      )
   ]
      ) 
    );
  }
}