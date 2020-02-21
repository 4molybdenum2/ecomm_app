import 'package:ecomm_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecomm_app/screens/loadingscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xff37d4f4),
      ),
      home: MyHomePage(),
    );
  }
}
