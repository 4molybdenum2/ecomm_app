import 'package:flutter/material.dart';
import 'package:ecomm_app/screens/settingschildren/accountpage.dart';
import 'package:ecomm_app/screens/settingschildren/login_page.dart';

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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,

            color: Colors.red[400],
            child: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ),
          ),
      ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              SizedBox(width: 20,),
              MaterialButton(
                onPressed: (){
                  if(accountexists() == true ) {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyAccountView();
                          },
                        )
                    );
                  }else{
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        )
                    );
                  }
                  },



                child: Text(
                  "My Account",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
            ],
          ),




        ],

      )

        ],
      ),
    );
  }
}


