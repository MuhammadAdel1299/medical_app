import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredential;
  var currentUser = FirebaseAuth.instance.currentUser;


  userSignUp() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await userDataStore(userCredential!.user!.uid, fullNameController.text,
        emailController.text);
  }

  userDataStore(String uid, String fullName, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'fullName': fullName,
      'email': email,
    });
  }

  userSignOUt() async => await FirebaseAuth.instance.signOut();

  userLogin() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  errorCatch() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
    }
  }
}
