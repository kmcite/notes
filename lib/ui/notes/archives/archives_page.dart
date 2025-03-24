// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/main.dart';

// class ArchivesBloc extends Cubit<Iterable<Note>> {
//   ArchivesBloc() : super([]) {
//     emit(archives);
//   }

//   Iterable<Note> get archives => notesRepository.getAll().where(
//         (note) => note.noteType == NoteType.Archived,
//       );

//   void unArchive(Note note) {
//     final was = note.was;
//     notesRepository.put(note..noteType = was);
//     emit(archives);
//   }
// }

// class ArchivesPage extends UI {
//   const ArchivesPage({super.key});

//   @override
//   Widget build(context) {
//     return FScaffold(
//       header: FHeader(
//         title: "Archives".text(),
//       ),
//       content: context.of<ArchivesBloc>().state.isEmpty
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.archive,
//                   size: 120,
//                   color: Colors.amber,
//                 ).center(),
//                 'Archives are empty for now'.text(),
//               ],
//             )
//           : ListView.builder(
//               itemCount: context.of<ArchivesBloc>().state.length,
//               itemBuilder: (context, index) {
//                 final note = context.of<ArchivesBloc>().state.elementAt(index);
//                 return FTile(
//                   title: Text(note.title),
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.unarchive),
//                     onPressed: () {
//                       context.of<ArchivesBloc>().unArchive(note);
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
