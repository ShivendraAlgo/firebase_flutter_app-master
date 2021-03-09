import 'package:firebase_flutter_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register(this.toggleView);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Register to Brew Crew"),
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
                      validator: (val) => val.length < 6
                          ? 'Enter a password  6+chars long'
                          : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }),
                  ElevatedButton(
                    child: Text(
                      "Register",
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print(email);
                        print(password);
                        dynamic result=await _auth.registerWithEmailAndPassword(email, password);
                          if(result==null){
                            setState(() {
                              error='please supply a valid email';
                            });
                          }
                      } else {}
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
