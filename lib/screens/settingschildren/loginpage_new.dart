import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(35.0, 80.0, 25.0, 25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello!',
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.red[400],
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Welcome to Delivry',
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              
              ScrollConfiguration(
              behavior: MyBehaviour(),
              child: Container(
                margin: EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.red[400], width: 2.0),borderRadius: BorderRadius.circular(5.0)),
                child: DefaultTabController(
                  length: 2, 
                  child:Column(
                    children: <Widget>[
                            TabBar(
                            isScrollable: false,
                            unselectedLabelColor: Colors.black,
                            labelColor: Color(0xffED305A),
                            indicatorPadding: EdgeInsets.all(5.0),
                            tabs: <Widget>[
                              Tab(
                                child: Text(
                                  'Log in',
                                  style: Style(),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Sign up',
                                  style: Style(),
                                ),
                              ),
                            ],
                      ),
                      SizedBox(
                        height: 440.0,
                        child: tabBarView()
                      )
                        
                    ],
                  ),
                ),
              ),
            ),
            ],
        ),
      ),
    );
  }

//--------------------------------------------------

//TODO: Change to ListView
  TextStyle Style() {
    TextStyle(
      fontFamily: 'QuickSand',
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
      color: Colors.black,
    );
  }
        TabBarView tabBarView() => TabBarView
      (
          children: [
            Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'example@email.com',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Password',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(onPressed: (){}, color: Colors.red[400], child: Text('Log in', style: TextStyle(color: Colors.white),),)
                ],
              ),
            ),
            Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'example@email.com',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Choose Username',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Choose Password',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Re-enter Password',contentPadding: const EdgeInsets.all(20.0),border: InputBorder.none),
                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(onPressed: (){}, color: Colors.red[400], child: Text('Sign up', style: TextStyle(color: Colors.white),),)
                ],
              ),
            ),
          ],
      );
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

