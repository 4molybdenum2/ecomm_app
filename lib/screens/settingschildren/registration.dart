import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // final auth = FirebaseAuth.instance;
  final mailController = TextEditingController();
  final passController = TextEditingController();
  String success = "fail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "E-Mail ID",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: mailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                      ),
//                  TODO: Need to add validator in every part of the form
//                  validator: ,
                      keyboardType: TextInputType.phone,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: passController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    // MaterialButton(
                    //   onPressed: () async {
                    //     try {
                    //       final newUser =
                    //           await auth.createUserWithEmailAndPassword(
                    //               email: mailController.text,
                    //               password: passController.text);

                    //       if(newUser != null){
                    //         setState(() {
                    //           success = "success";
                    //         });
                    //       }
                    //     } catch (e) {
                    //       print(e);
                    //     }
                    //   },
                    //   child: Text("REGISTER"),
                    // ),

                    Text(success),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
