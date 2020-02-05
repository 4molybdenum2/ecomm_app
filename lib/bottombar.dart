import 'package:flutter/material.dart';

class Bottom_Bar extends StatefulWidget {
  @override
  _Bottom_BarState createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
//    Dashboard(),
//    Chat(),
//    Profile(),
//    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
//  Widget currentScreen = Dashboard(); // Our first view in viewport
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Container(
        height: 60,
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
//                      currentScreen =
//                          Dashboard(); // if user taps on this dashboard tab will be active
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 0 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Text1',
                        style: TextStyle(
                          color: currentTab == 0 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
//                      currentScreen =
//                          Chat(); // if user taps on this dashboard tab will be active
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.chat,
                        color: currentTab == 1 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Text2',
                        style: TextStyle(
                          color: currentTab == 1 ? Colors.red[400] : Colors.grey,
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
//                      currentScreen =
//                          Profile(); // if user taps on this dashboard tab will be active
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 2 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Text3',
                        style: TextStyle(
                          color: currentTab == 2 ? Colors.red[400] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
//                      currentScreen =
//                          Settings(); // if user taps on this dashboard tab will be active
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.chat,
                        color: currentTab == 3 ? Colors.red[400] : Colors.grey,
                      ),
                      Text(
                        'Text4',
                        style: TextStyle(
                          color: currentTab == 3 ? Colors.red[400] : Colors.grey,
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
}
