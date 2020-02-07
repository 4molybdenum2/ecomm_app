import 'package:ecomm_app/screens/settingschildren/login_page.dart';
import 'package:ecomm_app/screens/settingschildren/registration.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_app/screens/settingschildren/accountpage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool accountexists(){
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            color: Colors.red[400],
            child: Text(
              "My Account",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (accountexists() == true) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MyAccountView();
                              },
                            ));
                          } else {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Registration();
                              },
                            ));
                          }
                        },
                        child: Text(
                          "My Account",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
