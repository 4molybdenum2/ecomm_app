import 'package:flutter/material.dart';

class Bottom_Bar extends StatefulWidget {
  @override
  _Bottom_BarState createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int _currentIndex = 0;
  final List<Widget> _children = [

  ];
  void onTabTapped(int index) {

    setState(() {
      if(index!=2) {
        _currentIndex = index;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new

      items: [
        new BottomNavigationBarItem(
          icon: Icon(
              Icons.home,
            color: Colors.red[400],
          ),
          title: Text(
              'Home',
            style: TextStyle(
              color: Colors.red[400],
            ),
          ),
        ),
        new BottomNavigationBarItem(
          icon: Icon(
              Icons.mail,
            color: Colors.red[400],
          ),
          title: Text(
              'Messages',
            style: TextStyle(
              color: Colors.red[400],
            ),
          ),
        ),
        new BottomNavigationBarItem(
            icon: Icon(
                Icons.minimize,
            ),
            title: Text("")
        ),
        new BottomNavigationBarItem(
            icon: Icon(
                Icons.person,
              color: Colors.red[400],
            ),
            title: Text(
                'Profile',
              style: TextStyle(
                color: Colors.red[400],
              ),
            )
        ),
         new BottomNavigationBarItem(
             icon: Icon(
                 Icons.ac_unit,
               color: Colors.red[400],
             ),
             title: Text(
                 'Cold Text',
               style: TextStyle(
                 color: Colors.red[400],
               ),
             )
         )
      ],
    );
  }
}
