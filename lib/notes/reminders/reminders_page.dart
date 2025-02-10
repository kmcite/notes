import 'package:notes/main.dart';

class RemindersPage extends UI {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: 'Reminders'.text(),
      ),
      body: ListView.builder(
        itemCount: remindersRM.reminders.length,
        itemBuilder: (context, index) {
          final reminder = remindersRM.reminders.elementAt(index);
          return FilledButton(
            onPressed: () => context.goNamed(
              Pages.reminder.name,
              extra: reminder.id,
            ),
            child: reminder.text(),
          ).pad();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'REMINDERS'.text(),
            FloatingActionButton(
              heroTag: randomId,
              onPressed: () => remindersRM.put(Note()),
              child: Icon(Icons.add),
            ).pad(),
          ],
        ),
      ),
    );
  }
}
