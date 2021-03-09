import 'package:firebase_flutter_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String error = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }),
                  ElevatedButton(
                    child: Text(
                      "Sign in",
                    ),
                    onPressed: () async {
                      print(email);
                      print(password);
                      if (_formKey.currentState.validate()) {
                        print("valid");
                       dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                       if(result==null){
                         setState(() {
                           error="could not sign in with  those credentials";
                         });
                       }
                      }
                    },
                  )
                ],
              ))),

      // Container(
      //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      //     child: ElevatedButton(
      //       onPressed: () async {
      //        dynamic result= await _auth.signInAnon();
      //        if(result==null){
      //          print('error signing in ');
      //        }else{
      //          print('signed in');
      //          print(result.uid);
      //        }
      //       },
      //       child: Text('Sign in anon'),
      //     )
      //
      //
      // )
    );
  }
}
