import 'package:flutter/material.dart';
import 'shopdetails.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  TabController _tabController;

  void gotodetails(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ShopDetail();
      },
    ),);
  }

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView(
        shrinkWrap: true,
            children: <Widget>[
//            TODO: Yahan stack ki jagah SliverAppBar use karna hai.
              Stack(
                  children: <Widget>[
                    Container(
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0)),
                        color: Colors.red[400],
                      ),
                    ),
                    Container(
                      height: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0)),
                        color: Colors.red[300],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.0 , left: 20.0),
                      child: Text('Hey welcome to our Ecomm App',
                        style: TextStyle(
                          color: Colors.white ,
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150.0, left: 15.0 , right: 30.0),
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0)
                          )
                        ),

                        child: TextField(

                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0, left: 20.0),
                            hintText: 'Search Products',
                            hintStyle: TextStyle(
                              fontFamily: 'Monserrat',
                              fontSize: 14.0,
                              color: Colors.grey,
                            )
                          ),
                        ),
                      )
                    )
                  ]
              ),
                  SizedBox(height: 10,),
                  TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    labelColor: Color(0xffED305A),
                    controller: _tabController,
                    indicator: BoxDecoration(
                    color: Color(0x55B71C1C),
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                      topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                    ),
                    ),
                    tabs: <Widget>[
                    Tab(
                    text: "Groceries",
                    ),
                    Tab(
                    text: "Furniture",
                    ),
                    Tab(
                    text: "Clothing",
                    ),
                    Tab(
                    text: "Electronics",
                    ),
                    Tab(
                    text: "Japan",
                    ),
                    Tab(
                    text: "China",
                    ),
                    ],
                  ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 100,
                      color: Colors.red[400],
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.image,
                            size: 75,
                          ),
                          Text('Shop 1',
                              style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        ],
                      ),
                      onPressed: () {
                        gotodetails();
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 100,
                      color: Colors.red[400],
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.image,
                            size: 75,
                          ),
                          Text('Shop 2',
                              style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        ],
                      ),
                      onPressed: () {
                        gotodetails();
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 100,
                      color: Colors.red[400],
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.image,
                            size: 75,
                          ),
                          Text('Shop 3',
                              style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        ],
                      ),
                      onPressed: () {
                        gotodetails();
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              )

//              GridView.count(
//                crossAxisCount: 2,
//                primary: false,
//                crossAxisSpacing: 2.0,
//                mainAxisSpacing: 4.0,
//                shrinkWrap: true,
//                children: <Widget>[
//                  BuildCard(name: "Item 1",status: "Here",cardIndex: 1,),
//                  BuildCard(name: "Item 2",status: "Here",cardIndex: 2,),
//                  BuildCard(name: "Item 3",status: "Here",cardIndex: 3,),
//                  BuildCard(name: "Item 4",status: "Here",cardIndex: 4,),
//                  BuildCard(name: "Item 5",status: "Here",cardIndex: 5,),
//                  BuildCard(name: "Item 6",status: "Here",cardIndex: 6,),
//
//                ],
//              )
            ],

          ),
    );
  }
}