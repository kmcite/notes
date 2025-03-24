// import 'package:notes/main.dart';

// class ImageNoteTile extends UI {
//   final Note note;
//   const ImageNoteTile({super.key, required this.note});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(note.id.toString()).pad(),
//             ),
//             Expanded(
//               child: Container(
//                 child: TextFormField(
//                   initialValue: note.title,
//                   onChanged: (value) {
//                     // reminders(this..title = value);
//                   },
//                   enabled: note.editing,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Title',
//                   ),
//                 ),
//               ).pad(),
//             ),
//             Switch(
//               value: note.editing,
//               onChanged: (value) {
//                 // reminders(this..editing = value);
//               },
//             ),
//           ],
//         ).pad(),
//         // Container(
//         //   child: Text(whenToRemind.toString()),
//         // ),
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('REMIND'),
//         )
//       ],
//     );
//   }
// }
