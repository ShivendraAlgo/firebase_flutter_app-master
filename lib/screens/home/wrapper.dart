import 'package:firebase_flutter_app/models/user.dart';
import 'package:firebase_flutter_app/screens/authenticate/authenticate.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserFireBase>(
        context); //listens for a change through provider mentioned in main
    print(user);
    // user==null?  Authenticate():Home();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
