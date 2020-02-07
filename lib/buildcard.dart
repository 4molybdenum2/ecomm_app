import 'package:flutter/material.dart';

class BuildCard extends StatefulWidget {
  int id;
  BuildCard({this.id});

  @override
  _BuildCardState createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  String name;
  String status;
  int id;
  String price;
  String mrp;
  getData(int id){

      switch(id){
        case 1:
          name = "Item 1";
          price="32 Rs";
          mrp = " 35 Rs";
          break;
        case 2:
          name = "Item 2";
          price="32 Rs";
          mrp = " 35 Rs";
          break;
        case 3:
          name = "Item 3";
          price="32 Rs";
          mrp = " 35 Rs";
          break;
        case 4:
          name = "Item 4";
          price="32 Rs";
          mrp = " 35 Rs";
          break;
      }
  }

  void initState() {
    super.initState();
    id = widget.id;
    getData(id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: new MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        elevation: 5.0,
        height: 150,
        minWidth: 140,
        color: Colors.red[400],
        child: Column(
          children: <Widget>[
            Icon(
              Icons.image,
              size: 75,
            ),
            Text('$name',
                style: new TextStyle(fontSize: 16.0, color: Colors.white)),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
