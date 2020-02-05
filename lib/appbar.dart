import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),

        title: Text(
          'Ecomm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
            )
        ),
        actions: <Widget>[
          
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
            ),

          IconButton(
            onPressed: null,
            icon:Icon(Icons.more_vert),
            color: Colors.black,
            ),
          
        ],

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
