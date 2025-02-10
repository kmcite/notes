import 'package:notes/main.dart';

class ReminderTile extends UI {
  const ReminderTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.deepPurple,
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Text(id.toString()).pad(),
            // ),
            // Expanded(
            //   child: Container(
            //     child: TextFormField(
            //       initialValue: title,
            //       onChanged: (value) {
            //         // reminders(this..title = value);
            //       },
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
            //     // reminders(this..editing = value);
            //   },
            // ),
          ],
        ).pad(),
        // Container(
        //   child: Text(whenToRemind.toString()),
        // ),
        ElevatedButton(
          onPressed: () {},
          child: Text('REMIND'),
        )
      ],
    );
  }
}
