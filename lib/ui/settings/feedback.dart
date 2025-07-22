import 'package:flutter/material.dart';
import 'package:notes/main.dart';

class FeedbackPage extends UI {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Feedback'.text().pad(),
      ),
      body: Icon(
        Icons.feedback,
        size: 100,
        color: Colors.amber,
      ).center(),
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
                  TextButton(
                    onPressed: () {
                      // Handle feedback submission
                      Navigator.of(context).pop();
                    },
                    child: Text('Submit'),
                  ),
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
