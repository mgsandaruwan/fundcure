import 'package:flutter/material.dart';
import 'package:funcure1/src/image_strings.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../login/login_screen.dart';
 // Import the LoginScreen class

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final liquidController = LiquidController();
  final int pageCount = 4;

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(onTap: () {  },)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LiquidSwipe(
          liquidController: liquidController,
          onPageChangeCallback: (page) {
            if (page == pageCount - 1) {
              _navigateToLoginScreen();
            }
          },
          ignoreUserGestureWhileAnimating: true,
          pages: [
            // Page 1
            Container(
              color: Color(0xFF1CBF72),
              child: Column(
                children: [
                  Expanded(
                    child: Image(image: AssetImage(tOnBoardingImage1)),
                  ),
                ],
              ),
            ),
            // Page 2
            Container(
              color: Color(0xFF1CBF72),
              child: Column(
                children: [
                  Expanded(
                    child: Image(image: AssetImage(tOnBoardingImage2)),
                  ),
                ],
              ),
            ),
            // Page 3
            Container(
              color: Color(0xFF1CBF72),
              child: Column(
                children: [
                  Expanded(
                    child: Image(image: AssetImage(tOnBoardingImage3)),
                  ),
                ],
              ),
            ),
            // Page 4
            Container(
              color: Color(0xFF1CBF72),
              child: Column(
                children: [
                  Expanded(
                    child: Image(image: AssetImage(tOnBoardingImage4)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
