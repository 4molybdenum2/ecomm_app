import 'package:ecomm_app/screens/products_page.dart';
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
  Image img;
  getData(int id){

    switch(id){
      case 1:
        name = "Groceries";

        break;
      case 2:
        name = "Electronics";

        break;
      case 3:
        name = "Furnitures";

        break;
      case 4:
        name = "Clothing";

        break;
      case 5:
        name = "China";

        break;
      case 6:
        name = "Japan";

        break;
    }
  }

  void popup(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage()));
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
      child: Container(
        decoration:BoxDecoration(border: Border.all(color: Colors.red , width: 1.0, ),borderRadius: BorderRadius.all(Radius.circular(10.0))),

        child: new MaterialButton(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          elevation: 5.0,
          height: 150,
          minWidth: 140,
          child: Column(
            children: <Widget>[
              Icon(
                  Icons.image
              ),
              Text('$name',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
            ],
          ),
          onPressed: () {
            popup();
          },
        ),
      ),
    );
  }
}
