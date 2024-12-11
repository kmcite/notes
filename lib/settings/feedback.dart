import 'package:notes/main.dart';

class FeedbackPage extends UI {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Card(
          child: 'Feedback'.text().pad(),
        ),
      ),
      body: null,
    );
  }
}
