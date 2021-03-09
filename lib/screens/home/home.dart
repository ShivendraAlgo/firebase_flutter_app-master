import 'dart:ui';

import 'package:firebase_flutter_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text("Brew Crew"),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ]));
  }
}
