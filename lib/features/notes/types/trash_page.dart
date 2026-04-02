// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/models/note.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/main.dart';

// class TrashBloc extends Cubit<Iterable<Note>> {
//   late NotesRepository notesRepository = of();

//   init() async {
//     notesRepository.stream.listen((_) => emit(notesRepository.trash));
//     return notesRepository.trash;
//   }

//   void restoreNote(Note note) {
//     final was = note.wasBefore;
//     notesRepository.put(note..noteType = was);
//   }

//   void permanentlyDeleteNote(Note note) {
//     notesRepository.remove(note.id);
//   }

//   void deleteAll() {
//     notesRepository.removeAll();
//   }
// }

// class TrashPage extends Feature<TrashBloc> {
//   const TrashPage({super.key});

//   @override
//   TrashBloc create() => TrashBloc();

//   @override
//   Widget build(BuildContext context, controller) {
//     if (controller().isEmpty) {
//       return Icon(
//         FIcons.delete,
//         size: 96,
//       );
//     }
//     return FScaffold(
//       child: ListView.separated(
//         separatorBuilder: (context, index) => Divider(
//             height: 1, thickness: 1, color: Theme.of(context).primaryColor),
//         itemCount: controller.state.length,
//         itemBuilder: (context, index) {
//           final note = controller.state.elementAt(index);
//           return FTile(
//             title: Text(note.title),
//             subtitle: Text(note.details),
//             prefix: FButton.icon(
//               // tooltip: "Restore",
//               child: Icon(FIcons.archiveRestore),
//               onPress: () {
//                 controller.restoreNote(note);
//               },
//             ).pad(
//                 // right: 8
//                 ),
//             suffix: FButton.icon(
//               child: Icon(FIcons.delete),
//               onPress: () => controller.permanentlyDeleteNote(note),
//             ).pad(
//                 // right: 8
//                 ),
//           ).pad();
//         },
//       ),
//     );
//   }
// }
