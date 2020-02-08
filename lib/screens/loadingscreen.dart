import 'package:ecomm_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_app/homepage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  void getLocationData() async {
    Future.delayed(const Duration(milliseconds: 3000), ()
    {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return MyHomePage(

          );
        }));
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
              colors: [Colors.red[400],Colors.red[300]]
          ),),
        child: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 50,

          ),
        ),
      ),
    );
  }
}
