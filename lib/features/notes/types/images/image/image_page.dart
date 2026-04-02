// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/models/note.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/main.dart';

// // class ImageNoteBloc extends Cubit<Note> {
// //   // ImageNoteBloc() : super(Note.none());

// //   // void load(Note note) {
// //   //   emit(note);
// //   // }

// //   // void submitToSave(Note note) {
// //   //   notesRepository.put(note);
// //   //   emit(note);
// //   // }

// //   // void delete() => emit(state..noteType = NoteType.Deleted);
// //   // void archive() => emit(state..noteType = NoteType.Archived);
// //   // void restoreAsNote() => emit(state..noteType = NoteType.NormalNote);
// //   // void restoreAsImage() => emit(state..noteType = NoteType.ImageNotes);

// //   // void unload() => emit(Note.none());
// // }

// class ImageNoteBloc extends Cubit<Note> {
//   final Note note;
//   ImageNoteBloc(this.note);
//   late NotesRepository notesRepository = of();

//   @override
//   Future<Note> init() async {
//     return note;
//   }

//   void onNoteDeleted() {
//     notesRepository.remove(note.id);
//     navigator.back();
//   }
// }

// class ImageNoteView extends Feature<ImageNoteBloc> {
//   final Note note;
//   const ImageNoteView({super.key, required this.note});

//   @override
//   ImageNoteBloc create() => ImageNoteBloc(note);

//   @override
//   Widget build(BuildContext context, controller) {
//     return FScaffold(
//       header: AppBar(
//         title: note.title.text(),
//       ),
//       child: note.details.text(),
//       footer: FloatingActionButton(
//         onPressed: () {
//           controller.onNoteDeleted();
//         },
//         child: const Icon(Icons.delete),
//       ),
//     );
//   }
// }
