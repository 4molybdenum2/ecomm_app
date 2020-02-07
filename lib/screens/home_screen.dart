import 'package:ecomm_app/buildcard.dart';
import 'package:flutter/material.dart';
import 'shopdetails.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  TabController _tabController;
  int mainid;


  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
  }
  void popup(int id){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView(
        shrinkWrap: true,
            children: <Widget>[
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
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  MaterialButton(
                      onPressed: (){
                        popup(1);
                      },
                      child: BuildCard(id:1)),
                  Expanded(
                    child: SizedBox(),
                  ),
                  MaterialButton(
                      onPressed: (){
                        popup(2);
                      },
                      child: BuildCard(id:2)),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  MaterialButton(
                      onPressed: (){
                        popup(3);
                      },
                      child: BuildCard(id:3)),
                  Expanded(
                    child: SizedBox(),
                  ),
                  MaterialButton(
                      onPressed: (){
                        popup(4);
                      },
                      child: BuildCard(id:4)),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],

          ),
    );
  }
}