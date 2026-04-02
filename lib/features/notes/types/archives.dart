// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/main.dart';

// import '../../../domain/models/note.dart';

// class ArchivesBloc extends Cubit<Iterable<Note>> {
//   late NotesRepository notesRepository = of();

//   ArchivesBloc() {
//     notesRepository.stream.listen((_) => emit(notesRepository.archives));
//   }

//   @override
//   Future<Iterable<Note>> init() async => notesRepository.archives;

//   void unArchiveNote(Note note) {
//     final was = note.wasBefore;
//     notesRepository.put(note..noteType = was);
//   }
// }

// class ArchivesView extends Feature<ArchivesBloc> {
//   const ArchivesView({super.key});

//   @override
//   ArchivesBloc create() => ArchivesBloc();

//   @override
//   Widget build(context, controller) {
//     if (controller.state.isEmpty) {
//       return Icon(
//         FIcons.archive,
//         size: 96,
//       );
//     }
//     return FScaffold(
//       child: ListView.builder(
//         itemCount: controller.state.length,
//         itemBuilder: (context, index) {
//           final note = controller.state.elementAt(index);
//           return FTile(
//             title: Text(note.title),
//             suffix: IconButton(
//               icon: Icon(Icons.unarchive),
//               onPressed: () => controller.unArchiveNote(note),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
