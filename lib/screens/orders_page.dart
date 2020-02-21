import 'package:ecomm_app/screens/settingschildren/loginpage_new.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,      
      child: LoginPage(),
    );
  }
}
