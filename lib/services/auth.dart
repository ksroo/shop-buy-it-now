import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String password) async {
    final _authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<UserCredential> signIp(String email, String password) async {
    final _authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }
}
