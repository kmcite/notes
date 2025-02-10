import 'package:notes/main.dart';
import 'package:notes/notes/reminders/reminder/reminder_bloc.dart';

class ReminderPage extends UI {
  const ReminderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.of<ReminderBloc>();
    final reminder = bloc.state;
    return AppScaffold(
      appBar: AppBar(
        title: reminder?.title.text(),
      ),
      body: reminder?.details.text(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.delete();
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
