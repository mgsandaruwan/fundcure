import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funcure1/src/features/authentication/log_or_reg_page.dart';
import 'package:funcure1/page/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return Home(); // Replace with the actual home page widget
          }
          // user is NOT logged in
          else {
            return LoginOrRegisterPage(); // Replace with the actual login page widget
          }
        },
      ),
    );
  }
}
