import 'package:flutter/material.dart';
import 'package:funcure1/src/features/authentication/screens/login/login_screen.dart';
import 'package:funcure1/src/features/authentication/screens/register/register.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterPageState createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // Initially show login page
  bool showLoginPage = true;

  // Toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if (showLoginPage){
    return LoginPage(
      onTap: togglePages,
      );
   }  else{
    return RegisterPage(
      onTap: togglePages
      );
   }
  }
}