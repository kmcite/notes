// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/main.dart';

// class ImageNoteBloc extends Cubit<Note> {
//   ImageNoteBloc() : super(Note.none());

//   void load(Note note) {
//     emit(note);
//   }

//   void submitToSave(Note note) {
//     notesRepository.put(note);
//     emit(note);
//   }

//   void delete() => emit(state..noteType = NoteType.Deleted);
//   void archive() => emit(state..noteType = NoteType.Archived);
//   void restoreAsNote() => emit(state..noteType = NoteType.NormalNote);
//   void restoreAsImage() => emit(state..noteType = NoteType.ImageNotes);

//   void unload() => emit(Note.none());
// }

// class ImageNotePage extends UI {
//   const ImageNotePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final reminder = context.of<ImageNoteBloc>().state;
//     return FScaffold(
//       header: AppBar(
//         title: reminder.title.text(),
//       ),
//       content: reminder.details.text(),
//       footer: FloatingActionButton(
//         onPressed: () {
//           context.of<ImageNoteBloc>().delete();
//         },
//         child: const Icon(Icons.delete),
//       ),
//     );
//   }
// }
