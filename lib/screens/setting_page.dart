import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int index = 0;
  final List<Widget> settingchildren = [
    MainSettingView(),
    MyAccountView(),

  ];

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
          settingchildren[index],

        ],
      ),
    );
  }
}

class MainSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            SizedBox(width: 20,),
            MaterialButton(
              onPressed: (){

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

    );
  }
}


class MyAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
