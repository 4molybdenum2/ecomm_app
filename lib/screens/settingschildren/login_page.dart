import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50,),

          MaterialButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) {
                      return login1();
                    },
                  )
              );
            },
            child: Text("Login"),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) {
                      return signup();
                    },
                  )
              );
            },
            child: Text("SignUp"),
          ),
        ],
      ),
    );
  }

}

class login1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
    );
  }
}
