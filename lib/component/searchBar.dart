import 'package:flutter/material.dart';

class SeacrhBar extends StatelessWidget {
  const SeacrhBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
                color: Color(0xFFEDCF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )
                )
            ),
        ],
      ),
    );
  }
}
