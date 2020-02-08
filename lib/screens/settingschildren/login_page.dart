import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
//                TODO: Add validators
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "E-Mail ID",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
