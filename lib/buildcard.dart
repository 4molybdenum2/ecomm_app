import 'package:ecomm_app/screens/products_page.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatefulWidget {
  final int id;
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
  String imgname;
  Image img;
  getData(int id) {
    switch (id) {
      case 1:
        name = "Fruits & Vegetables";
        imgname="grocerymain.png";
        break;
      case 2:
        name = "Electronics";
        imgname="electronics.png";
        break;
      case 3:
        name = "Personal Care";
        imgname="personal.png";
        break;
      case 4:
        name = "Medicines";
        imgname="medicine.png";
        break;
      case 5:
        name = "Branded Foods";
        imgname="snacks.png";
        break;
      case 6:
        name = "Clothing";
        imgname="clothing.png";
        break;
    }
  }

  void popup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductsPage()));
  }

  void initState() {
    super.initState();
    id = widget.id;
    getData(id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150.0,

          decoration: BoxDecoration(
           // color:Color.fromARGB(8, 16, 235, 255),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.red[400], width: 1.69),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Image.asset('assets/images/$imgname'),
              SizedBox(height: 15.0),
              Text('$name',
                  style:
                      new TextStyle(fontSize: 12.0, color: Colors.orange[400])),
            ],
          ),
        ),
      ),
      onTap: () {
        popup();
      },
    );
  }
}
