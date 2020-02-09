import 'package:ecomm_app/screens/products_page.dart';
import 'package:flutter/material.dart';
import 'shopdetails.dart';
import 'package:ecomm_app/buildcard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  int superid;
  HomeScreen({Key key,superid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  FirebaseUser curUser;
  TabController _tabController;
  //int mainid=widget.superid;

  void gotodetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ShopDetail();
        },
      ),
    );
  }

  void getUser() async {
    try {
      final user = await auth.currentUser();
      if (user != null) {
        curUser = user;
        print(curUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
//            TODO: Yahan stack ki jagah SliverAppBar use karna hai.
          Stack(children: <Widget>[
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(75.0)),
                color: Colors.red[400],
              ),
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(75.0)),
                color: Colors.red[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 20.0),
              child: Text(
                'Hey welcome to our Ecomm App',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 150.0, left: 15.0, right: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0))),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search , color: Color(0xff37d4f4),),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0, left: 20.0),
                        hintText: 'Search Products',
                        hintStyle: TextStyle(
                          fontFamily: 'Monserrat',
                          fontSize: 14.0,
                          color: Colors.grey,
                        )),
                  ),
                ))
          ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: Text(
                'Shopping Categories:',
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54, 
                  ),
              ),
          ),

//          ScrollConfiguration(
//            behavior: MyBehaviour(),
//            child: Container(
//              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
//              child: TabBar(
//                isScrollable: true,
//                unselectedLabelColor: Colors.black,
//                labelColor: Color(0xffED305A),
//                controller: _tabController,
//                indicatorPadding: EdgeInsets.all(5.0),
//                indicator: BoxDecoration(
//                  color: Color(0x55B71C1C),
//                  borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(15),
//                    topLeft: Radius.circular(5),
//                    bottomLeft: Radius.circular(15),
//                    bottomRight: Radius.circular(5),
//                  ),
//                ),
//                tabs: <Widget>[
//                  Tab(
//                    text: "Groceries",
//                  ),
//                  Tab(
//                    text: "Furniture",
//                  ),
//                  Tab(
//                    text: "Clothing",
//                  ),
//                  Tab(
//                    text: "Electronics",
//                  ),
//                  Tab(
//                    text: "Japan",
//                  ),
//                  Tab(
//                    text: "China",
//                  ),
//                ],
//              ),
//            ),
//          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {},
                  child: BuildCard(id: 1)),
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {

                  },
                  child: BuildCard(id: 2)),
//              Expanded(
//                child: SizedBox(),
//              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {},
                  child: BuildCard(id: 3)),
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {

                  },
                  child: BuildCard(id: 4)),
//              Expanded(
//                child: SizedBox(),
//              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {},
                  child: BuildCard(id: 5)),
//              Expanded(
//                child: SizedBox(),
//              ),
              MaterialButton(
                  onPressed: () {

                  },
                  child: BuildCard(id: 6)),
//              Expanded(
//                child: SizedBox(),
//              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),

        ],
      ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
