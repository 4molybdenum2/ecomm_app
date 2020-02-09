import 'package:ecomm_app/screens/cartscreen.dart';
import 'package:ecomm_app/screens/home_screen.dart';
import 'package:ecomm_app/screens/orders_page.dart';
import 'package:ecomm_app/screens/cartscreen.dart';
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

  Widget _bottomAppBar(){
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: Row(
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
                          Icons.shopping_cart,
                          size: currentTab == 1 ? 35 : 30,
                          color:
                          currentTab == 1 ? Colors.red[400] : Colors.grey,
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: currentTab == 1 ? 15 : 10,
                            color:
                            currentTab == 1 ? Colors.red[400] : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

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
                  ),

                ],
              ),
        ),

            // Right Tab bar icons


      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentTab],
      bottomNavigationBar: _bottomAppBar(),
    );
  }
}
