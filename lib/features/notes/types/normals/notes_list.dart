// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/models/note.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/features/notes/note/note.dart';
// import 'package:notes/main.dart';

// class NotesListBloc extends Cubit<Iterable<Note>> {
//   late NotesRepository notes = of();

//   @override
//   Future<Iterable<Note>> init() async {
//     notes.stream.listen((_) => emit(notes.normals));
//     return notes.normals;
//   }
// }

// class NotesListView extends Feature<NotesListBloc> {
//   const NotesListView({super.key});

//   @override
//   NotesListBloc create() => NotesListBloc();

//   @override
//   Widget build(BuildContext context, controller) {
//     if (controller.state.isEmpty) {
//       return const Icon(
//         FIcons.notebook,
//         size: 96,
//       );
//     }
//     return Column(
//       children: List.generate(
//         controller.state.length,
//         (i) {
//           final note = controller.state.elementAt(i);
//           return FTile(
//             title: note.title.text(),
//             subtitle: note.details.text(),
//             onPress: () {
//               navigator.to(NoteView(note: note));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
