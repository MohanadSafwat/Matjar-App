//import 'dart:html';
import 'package:flutter/material.dart';
import './payment.dart';




class SelectedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,toolbarHeight: 60,backgroundColor: Colors.red,
        title: Text('matgar',style: TextStyle(fontFamily: "DancingScript",),),
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
                      child: RaisedButton(
                        onPressed: null,
                        child: Text('Add to Cart',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        color: Colors.blue,
                      ),
                    ),
                    bottom: 5,
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
}
