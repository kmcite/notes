// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/domain/models/note.dart';
// import 'package:notes/features/notes/note/note.dart';

// import 'package:notes/main.dart';

// class NotesGridBloc extends Cubit<Iterable<Note>> {
//   late NotesRepository notes = of();
//   NotesGridBloc() {
//     notes.stream.listen((_) => emit(notes.normals));
//   }
//   @override
//   Future<Iterable<Note>> init() async => notes.normals;
// }

// class NotesGridView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FeatureView(
//       created: NotesGridBloc(),
//       builder: (context, controller) {
//         if (controller.state.isEmpty) {
//           return Icon(
//             FIcons.notebookPen,
//             size: 96,
//           );
//         }
//         return GridView.builder(
//           itemCount: controller.state.length,
//           itemBuilder: (context, index) {
//             final note = controller.state.elementAt(index);
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 8,
//               children: [
//                 note.title.text(),
//                 note.details.text(),
//                 FButton.icon(
//                   onPress: () {
//                     navigator.to(NoteView(note: note));
//                   },
//                   child: Icon(FIcons.info),
//                 ),
//               ],
//             );
//           },
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//         );
//       },
//     );
//   }
// }
