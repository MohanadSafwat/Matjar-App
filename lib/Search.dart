import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Search();
  }
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Container(
          child: new Column(
          children: [
            Text(
              "Matjar",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "DancingScript",
              ),
            ),
            new Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child :
            new TextField(
              controller: null,
              decoration: new InputDecoration(
                  hintText: 'Search',
                  contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
                  ),
            )
            )
          ],
        ),
        ),
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Column(
                  children: [
                      new Text('Recent',style: TextStyle(fontSize: 21 , fontWeight: FontWeight.bold),),
                      new FlatButton(onPressed: null, child: new Text('Larem imps',style: TextStyle(fontSize: 21))),
                      new FlatButton(onPressed: null, child: new Text('Larem imps',style: TextStyle(fontSize: 21))),
                      new FlatButton(onPressed: null, child: new Text('Larem imps',style: TextStyle(fontSize: 21)))

                  ],
                ),
                new Column(
                  children: [
                      new FlatButton(onPressed: null, child: new Text('Clear',style: TextStyle(fontSize: 21))),
                      new FlatButton(onPressed: null, child: new Icon(Icons.arrow_upward)),
                      new FlatButton(onPressed: null, child: new Icon(Icons.arrow_upward)),
                      new FlatButton(onPressed: null, child: new Icon(Icons.arrow_upward))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
