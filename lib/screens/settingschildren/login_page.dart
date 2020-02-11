import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecomm_app/homepage.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  final mailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    controller: mailController,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                    controller: passController,
                  ),

                  MaterialButton(
                    onPressed: () async {
                      try {
                        final authRes = await auth
                            .signInWithEmailAndPassword(
                                email: mailController.text,
                                password: passController.text)
                            .catchError((PlatformException error) {
                          showCupertinoDialog(
                              context: context,
                              builder: (_) => CupertinoAlertDialog(
                                    title: Text("Error"),
                                    content: Text(error.message),
                                  ));
                          return null;
                        });

//                        final user =  authRes.user;

//                        if(user != null){
//                        Navigator.push(context, MaterialPageRoute(
//                            builder: (context){
//                              return MyHomePage();
//                            }
//                        ));
//                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("LOGIN"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
