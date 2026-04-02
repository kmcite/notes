import 'package:flutter/material.dart';
import 'package:notes/domain/repositories/navigator.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Icon(Icons.feedback, size: 100, color: Colors.amber),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Feedback'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Enter your feedback'),
                ),
                actions: [
                  TextButton(onPressed: () => pop(), child: Text('Submit')),
                ],
              );
            },
          );
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
