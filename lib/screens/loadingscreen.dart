import 'package:flutter/material.dart';
import 'package:ecomm_app/homepage.dart';
import 'package:ecomm_app/screens/settingschildren/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void function(String name) async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString('prevUser', name);
    if(name!=null){

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) {
        return MyHomePage(
          userid: name,
        );
      }));
    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return Login();
          }));
    }
  }
  void getLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String curr = prefs.get('prevUser');
    Future.delayed(const Duration(milliseconds: 2250), ()
    {
      setState((){
       function(curr);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red[400],Colors.red[300]],
          ),),
        child: Center(
//        TODO: CheckInternet
        child: Image(
          image: AssetImage('assets/images/snacks.png'),
        ),
        ),
      ),
    );
  }
}
