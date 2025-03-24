// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/main.dart';

// final TrashedBloc trashedRM = TrashedBloc();

// class TrashedBloc extends Cubit<Iterable<Note>> {
//   TrashedBloc() : super([]) {
//     emit(trashed);
//   }

//   Iterable<Note> get trashed => notesRepository.getAll().where(
//         (any) => any.noteType == NoteType.Deleted,
//       );

//   void restoreNote(Note note) {
//     final was = note.was;
//     notesRepository.put(note..noteType = was);
//     emit(trashed);
//   }

//   void permanentlyDeleteNote(Note note) {
//     notesRepository.delete(note.id);
//     emit(trashed);
//   }

//   void deleteAll() {
//     notesRepository.clear();
//     emit(trashed);
//   }
// }

// class TrashPage extends UI {
//   const TrashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FScaffold(
//       header: FHeader(
//         title: 'Trash'.text(),
//         actions: [
//           IconButton.filledTonal(
//             tooltip: 'DELETE ALL',
//             color: Colors.red,
//             icon: Icon(Icons.delete_forever),
//             onPressed:
//                 trashedRM.trashed.isEmpty ? null : () => trashedRM.deleteAll(),
//           ).pad(right: 8),
//         ],
//       ),
//       content: context.of<TrashedBloc>().state.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.delete_forever,
//                     size: 120,
//                     color: Colors.amber,
//                   ),
//                   'Trash is empty for now'.text(),
//                 ],
//               ),
//             )
//           : ListView.separated(
//               separatorBuilder: (context, index) => Divider(
//                   height: 1,
//                   thickness: 1,
//                   color: Theme.of(context).primaryColor),
//               itemCount: context.of<TrashedBloc>().state.length,
//               itemBuilder: (context, index) {
//                 final note = context.of<TrashedBloc>().state.elementAt(index);
//                 return FTile(
//                   title: Text(note.title),
//                   subtitle: Text(note.details),
//                   prefixIcon: IconButton(
//                     tooltip: "Restore",
//                     icon: FIcon(FAssets.icons.archiveRestore),
//                     onPressed: () =>
//                         context.of<TrashedBloc>().restoreNote(note),
//                   ).pad(right: 8),
//                   suffixIcon: IconButton(
//                     tooltip: "Permanently Delete",
//                     icon: FIcon(FAssets.icons.delete),
//                     onPressed: () =>
//                         context.of<TrashedBloc>().permanentlyDeleteNote(note),
//                   ).pad(right: 8),
//                 ).pad();
//               },
//             ),
//     );
//   }
// }
