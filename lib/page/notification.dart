import 'package:flutter/material.dart';

void main() => runApp(Notifi());

class Notifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1CBF72),
          title: Text('Notification'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press here
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Text('Your notification content goes here'),
        ),
      ),
    );
  }
}
