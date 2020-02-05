import 'package:flutter/material.dart';
import 'bottombar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(75.0)),
                color: Colors.red[400],
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(75.0)),
                color: Colors.red[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 20.0),
              child: Text(
                'Hey welcome to our Ecomm App',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 150.0, left: 15.0, right: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0))),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0, left: 20.0),
                        hintText: 'Search Products',
                        hintStyle: TextStyle(
                          fontFamily: 'Monserrat',
                          fontSize: 14.0,
                          color: Colors.grey,
                        )),
                  ),
                ))
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}
