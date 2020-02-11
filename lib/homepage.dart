import 'package:ecomm_app/screens/cartscreen.dart';
import 'package:ecomm_app/screens/home_screen.dart';
import 'package:ecomm_app/screens/orders_page.dart';
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
    CartScreen(),
    OrdersPage(),
    SettingsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _children[currentTab],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int i){
          setState(() {
            currentTab = i;
          });

        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red[400],
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'Montserrat'
        ),
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Orders")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("My Account")
          ),
        ],
      ),
    );
  }
}
