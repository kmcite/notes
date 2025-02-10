import 'package:notes/main.dart';

class FeedbackPage extends UI {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: 'Feedback'.text().pad(),
      ),
      body: Icon(
        Icons.feedback,
        size: 100,
        color: Colors.amber,
      ).center(),
    );
  }
}
