import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

enum payment_method { credit, cash }

class _PaymentState extends State<Payment> {
  payment_method _method = payment_method.credit;
  final TextEditingController _nameOnCard = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _validThrough = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'matgar',
          style: TextStyle(
            fontFamily: "DancingScript",
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Buy throw credit card'),
            leading: Radio(
              value: payment_method.credit,
              groupValue: _method,
              onChanged: (payment_method value) {
                setState(() {
                  _method = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 39),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name on card',
                      border: OutlineInputBorder(),
                    ),
                    controller: _nameOnCard,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                    controller: _cardNumber,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 168),
                      padding: EdgeInsets.only(bottom: 10),
                      width: 130,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'valid',
                          border: OutlineInputBorder(),
                        ),
                        controller: _validThrough,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38),
                      padding: EdgeInsets.only(bottom: 10),
                      width: 110,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'cvv',
                          border: OutlineInputBorder(),
                        ),
                        controller: _cvv,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            title: Text('Buy cash'),
            leading: Radio(
              value: payment_method.cash,
              groupValue: _method,
              onChanged: (payment_method value) {
                setState(() {
                  _method = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 38, right: 40),
            padding: EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'where you want to pick up',
                border: OutlineInputBorder(),
              ),
              controller: _cvv,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:190),
            width: 100,
            child: RaisedButton(
                child: Text('Purshe',style: TextStyle(color: Colors.white),),
                onPressed: (){print('1');},
                
                color: Colors.red)
          )
        ],
      ),
    );
  }
}
