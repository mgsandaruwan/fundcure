import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FAQItem(
            question: 'How do I reset my password?',
            answer: 'To reset your password, go to the login page and click on "Forgot Password."...',
          ),
          FAQItem(
            question: 'How can I contact customer support?',
            answer: 'You can reach our customer support team at support@example.com or call...',
          ),
          // Add more FAQ items as needed
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
