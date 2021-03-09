import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_app/models/user.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; //for interacting with firebase authentication

  //sign in anon
  UserFireBase _userFromFirebaseUser(User user) {
    return user != null ? UserFireBase(user.uid) : null;
  }

  //auth change user stream
  Stream<UserFireBase> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map((_userFromFirebaseUser));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password  );
      User user = result.user;
    } catch (e) {}
  }
  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
    } catch (e) {}
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
