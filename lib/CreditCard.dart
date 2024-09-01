import 'package:flutter/material.dart';
class creditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
            child: Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                  child: Stack(
                    children: [
                      Container(
                        width: 414,
                        height: 896,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 14,
                              top: 48,
                              child: Container(
                                padding: const EdgeInsets.only(right: 127),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      child: Stack(children: [

                                      ]),
                                    ),
                                    const SizedBox(width: 110),
                                    Text(
                                      'Make Donation',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1F2122),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 45,
                              top: 844,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'If you want to donate more, please ',
                                      style: TextStyle(
                                        color: Color(0xFF1F2122),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'contact us.',
                                      style: TextStyle(
                                        color: Color(0xFF000AFF),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              top: 440,
                              child: Container(
                                width: 386,
                                height: 246,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 2,
                                      child: Text(
                                        'Select Payment Method',
                                        style: TextStyle(
                                          color: Color(0xFF1F2122),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 190,
                                      child: Text(
                                        'Select Amount & Pay',
                                        style: TextStyle(
                                          color: Color(0xFF1F2122),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 39,
                                      child: Container(
                                        width: 386,
                                        height: 139,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x0A000000),
                                              blurRadius: 48,
                                              offset: Offset(0, 2),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 52,
                                      child: Container(
                                        width: 358,
                                        height: 49,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 12,
                                              child: Container(
                                                width: 26,
                                                height: 26,
                                                decoration: ShapeDecoration(
                                                  shape: OvalBorder(
                                                    side: BorderSide(width: 1, color: Color(0xFFEAEBEC)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 38,
                                              top: 0,
                                              child: Container(
                                                width: 320,
                                                height: 49,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1, color: Color(0xFFEAEBEC)),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 52,
                                              top: 17,
                                              child: Text(
                                                'Credit Card',
                                                style: TextStyle(
                                                  color: Color(0xFF909596),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 306,
                                              top: 14,
                                              child: Container(
                                                width: 38,
                                                height: 21,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFDEDBD7),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 6,
                                              top: 18,
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF1CBF72),
                                                  shape: OvalBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 116,
                                      child: Container(
                                        width: 358,
                                        height: 49,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 12,
                                              child: Container(
                                                width: 26,
                                                height: 26,
                                                decoration: ShapeDecoration(
                                                  shape: OvalBorder(
                                                    side: BorderSide(width: 1, color: Color(0xFFEAEBEC)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 38,
                                              top: 0,
                                              child: Container(
                                                width: 320,
                                                height: 49,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1, color: Color(0xFFEAEBEC)),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 52,
                                              top: 17,
                                              child: Text(
                                                'Bank Transfer',
                                                style: TextStyle(
                                                  color: Color(0xFF909596),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 203,
                                              top: 17,
                                              child: Text(
                                                'Commercial Bank',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xFF1F2122),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              top: 664,
                              child: Container(
                                width: 386,
                                height: 148,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 48,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 36,
                              top: 678,
                              child: Container(
                                width: 165,
                                height: 53,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDFFFF0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 48,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 218,
                              top: 744,
                              child: Container(
                                width: 165,
                                height: 53,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDFFFF0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 48,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 34,
                              top: 744,
                              child: Container(
                                width: 165,
                                height: 53,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDFFFF0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 48,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 218,
                              top: 678,
                              child: Container(
                                width: 165,
                                height: 53,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDFFFF0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 48,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 105,
                              top: 695,
                              child: Text(
                                '5\$',
                                style: TextStyle(
                                  color: Color(0xFF909596),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 286,
                              top: 692,
                              child: Text(
                                '10\$',
                                style: TextStyle(
                                  color: Color(0xFF909596),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              top: 87,
                              child: Container(
                                width: 386,
                                height: 265,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 386,
                                        height: 265,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF2A2727),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(14),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 14,
                                      child: Container(
                                        width: 358,
                                        height: 205,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 358,
                                                height: 205,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 358,
                                                height: 205,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.circular(14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 105,
                              top: 758,
                              child: Text(
                                '25\$',
                                style: TextStyle(
                                  color: Color(0xFF909596),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 285,
                              top: 758,
                              child: Text(
                                '50\$',
                                style: TextStyle(
                                  color: Color(0xFF909596),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
