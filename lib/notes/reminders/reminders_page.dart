import 'package:notes/main.dart';

class RemindersPage extends UI {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: remindersRM.reminders.length,
        itemBuilder: (context, index) {
          return remindersRM.reminders[index].text();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            'REMINDERS'.text(),
            FloatingActionButton(
              // heroTag: randomID,
              onPressed: () => remindersRM.put(Note()),
              child: Icon(Icons.add),
            ).pad(),
          ],
        ),
      ),
    );
  }
}

// @Entity()
class Reminder extends UI {
  // @Id()
  int id = 0;
  String title = '';
  DateTime whenToRemind = DateTime.now();
  bool editing = false;
  // @Transient()
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(id.toString()).pad(),
            ),
            // Expanded(
            //   child: Container(
            //     child: TextFormField(
            //       initialValue: title,
            //       onChanged: (value) => reminders(this..title = value),
            //       enabled: editing,
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: 'Title',
            //       ),
            //     ),
            //   ).pad(),
            // ),
            // Switch(
            //   value: editing,
            //   onChanged: (value) {
            //     reminders(this..editing = value);
            //   },
            // ),
          ],
        ).pad(),
        Container(
          child: Text(whenToRemind.toString()),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('REMIND'),
        )
      ],
    );
  }
}
