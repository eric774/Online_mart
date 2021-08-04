import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_mart/HomePage.dart';
import 'package:online_mart/Pages/Auth/AuthWithGoogle/LoginPage.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else
            return LoginPage();
        });
  }
}
