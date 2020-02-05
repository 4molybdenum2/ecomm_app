import 'package:flutter/material.dart';

class  App_Bar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back),
        ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}