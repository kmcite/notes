// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/main.dart';
// import 'package:notes/notes/image_notes/image_note/image_note_page.dart';
// import 'package:notes/notes/image_notes/image_note_tile.dart';

// class ImageNotesBloc extends Cubit<Iterable<Note>> {
//   ImageNotesBloc() : super([]) {
//     emit(imageNotes);
//   }

//   Iterable<Note> get imageNotes {
//     return notesRepository.getAll().where(
//       (any) {
//         return any.noteType == NoteType.ImageNotes;
//       },
//     );
//   }

//   void put(Note note) {
//     notesRepository.put(note..noteType = NoteType.ImageNotes);
//     emit(imageNotes);
//   }
// }

// class ImageNotesPage extends UI {
//   const ImageNotesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FScaffold(
//       header: FHeader(
//         title: 'Images'.text(),
//       ),
//       content: ListView.builder(
//         itemCount: context.of<ImageNotesBloc>().state.length,
//         itemBuilder: (context, index) {
//           final note = context.of<ImageNotesBloc>().state.elementAt(index);
//           return FButton(
//             onPress: () {
//               context.of<NavigationBloc>().to(ImageNotePage());
//             },
//             label: ImageNoteTile(note: note),
//           ).pad();
//         },
//       ),
//       footer: FButton(
//         onPress: () => context.of<ImageNotesBloc>().put(Note()),
//         label: Icon(Icons.add),
//       ).pad(),
//     );
//   }
// }
