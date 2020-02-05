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
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new

      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text('Messages'),
        ),
        new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
        ),
        // new BottomNavigationBarItem(
        //     icon: Icon(Icons.ac_unit),
        //     title: Text('Cold Text')
        // )
      ],
    );
  }
}
