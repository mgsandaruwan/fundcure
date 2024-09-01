import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigate to the OnBoardingScreen when tapped
            Navigator.pushNamed(context, '/onboarding');
          },
          child: Image.asset(
            'assets/images/FundCure_Logo3.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

