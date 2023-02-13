import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_user/login/view/login_page.dart';
import 'package:ecommerce_user/signup/bloc/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> createUser(UserSignupEvent event) async {
  final auth = FirebaseAuth.instance;
  final CollectionReference userRefferance =
      FirebaseFirestore.instance.collection('usercollection');

  try {
    final userCredential = await auth.createUserWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    await userRefferance.doc(userCredential.user!.uid).set({
      'username': event.name,
      'email': event.email,
      'phone': event.phonenumber,
      'password': event.password,
      'user_id': auth.currentUser!.uid,
      'type': 'user'
    });
  } on FirebaseAuthException catch (e) {
    print(e);
    throw Exception('Invalid Email or Password');
  }
}
