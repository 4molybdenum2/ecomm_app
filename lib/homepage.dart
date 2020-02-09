import 'package:ecomm_app/screens/home_screen.dart';
import 'package:ecomm_app/screens/orders_page.dart';
import 'package:ecomm_app/screens/products_page.dart';
import 'package:ecomm_app/screens/setting_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ProductsPage(),
    OrdersPage(),
    SettingsPage()
  ];

  Widget _bottomAppBar(){
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: currentTab == 0 ? 35 : 30,
                        color:
                        currentTab == 0 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: currentTab == 0 ? 15 : 10,
                          color:
                          currentTab == 0 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.store,
                        size: currentTab == 1 ? 35 : 30,
                        color:
                        currentTab == 1 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Products',
                        style: TextStyle(
                          fontSize: currentTab == 1 ? 15 : 10,
                          color:
                          currentTab == 1 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Right Tab bar icons

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: currentTab == 2 ? 35 : 30,
                        color:
                        currentTab == 2 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: currentTab == 2 ? 15 : 10,
                          color:
                          currentTab == 2 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: currentTab == 3 ? 35 : 30,
                        color:
                        currentTab == 3 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'My Account',
                        style: TextStyle(
                          fontSize: currentTab == 3 ? 15 : 10,
                          color:
                          currentTab == 3 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _children[currentTab],
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.orange,
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xff37d4f4),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomAppBar(),
    );
  }
}
