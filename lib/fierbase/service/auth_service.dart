import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persons_lost/fierbase/modle/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // GET UID
  // String getCurrentUID() {
  //   return _firebaseAuth.currentUser.uid;
  // }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  // Email & Password Sign Up
  createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Create Anonymous User
    // Future singInAnonymously() {
    //   return _firebaseAuth.signInAnonymously();
    // }
  }
}
