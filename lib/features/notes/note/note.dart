// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/domain/models/note.dart';
// import 'package:notes/features/notes/note/note_edit_toolbar.dart';
// import 'package:notes/main.dart';

// class NoteState {
//   final Note note;
//   final bool hasChanges;
//   const NoteState({required this.note, this.hasChanges = false});
//   NoteState copyWith({Note? note, bool? hasChanges}) {
//     return NoteState(
//       note: note ?? this.note,
//       hasChanges: hasChanges ?? this.hasChanges,
//     );
//   }
// }

// class NoteBloc extends Cubit<NoteState> {
//   final Note note;
//   @override
//   Future<NoteState> init() async {
//     return NoteState(note: note);
//   }

//   late NotesRepository notesRepository = of();

//   NoteBloc(this.note);

//   void onTitleChanged(String value) {
//     emit(
//       state.copyWith(note: state.note..title = value, hasChanges: true),
//     );
//   }

//   void onDetailsChanged(String value) {
//     emit(
//       state.copyWith(note: state.note..details = value, hasChanges: true),
//     );
//   }

//   void onDeleted() {
//     notesRepository.remove(state.note.id);
//     emit(
//       state.copyWith(hasChanges: false),
//     );
//     onCancelled();
//   }

//   void onSaved() async {
//     await notesRepository.put(state.note);
//     emit(
//       state.copyWith(hasChanges: false),
//     );
//   }

//   void onDiscarded() async {
//     emit(
//       state.copyWith(hasChanges: false),
//     );
//   }

//   void onCancelled() async {
//     navigator.back();
//     final _note = await notesRepository()
//         .where((any) => any.id == state.note.id)
//         .firstOrNull;
//     if (_note != null) notesRepository.put(_note);
//   }

//   void onArchived() {
//     emit(
//       state.copyWith(
//         note: state.note..noteType = NoteType.archives,
//         hasChanges: true,
//       ),
//     );
//   }

//   void onRestoredAsNote() {
//     emit(
//       state.copyWith(
//         note: state.note..noteType = NoteType.normal,
//         hasChanges: true,
//       ),
//     );
//   }

//   void onStatusToggled() {
//     if (state.note.noteStatus == NoteStatus.Complete) {
//       emit(
//         state.copyWith(
//           note: state.note..noteStatus = NoteStatus.Incomplete,
//           hasChanges: true,
//         ),
//       );
//     } else {
//       emit(
//         state.copyWith(
//           note: state.note..noteStatus = NoteStatus.Complete,
//           hasChanges: true,
//         ),
//       );
//     }
//   }

//   void onTypeChanged(NoteType type) {
//     emit(
//       state.copyWith(
//         note: state.note..noteType = type,
//         hasChanges: true,
//       ),
//     );
//   }
// }

// class NoteView extends Feature<NoteBloc> {
//   final Note note;
//   NoteView({super.key, required this.note});

//   @override
//   NoteBloc create() => NoteBloc(note);

//   @override
//   Widget build(BuildContext context, controller) {
//     return FScaffold(
//       child: Column(
//         spacing: 16,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FHeader.nested(
//             title: Text(controller.state.note.title),
//             prefixes: [
//               FButton.icon(
//                 onPress: navigator.back,
//                 child: Icon(FIcons.arrowLeft),
//               ),
//             ],
//             suffixes: [
//               FButton.icon(
//                 style: FButtonStyle.destructive(),
//                 onPress:
//                     controller.state.hasChanges ? controller.onSaved : null,
//                 child: Icon(FIcons.save),
//               ),
//               FButton.icon(
//                 style: FButtonStyle.destructive(),
//                 onPress:
//                     controller.state.hasChanges ? controller.onDiscarded : null,
//                 child: Icon(FIcons.delete),
//               ),
//             ],
//           ),
//           FTextField(
//             label: Text('Title'),
//             key: ValueKey('title'),
//             initialText: controller.state.note.title,
//             onChange: controller.onTitleChanged,
//             maxLines: null,
//           ),
//           Expanded(
//             child: FTextField(
//               label: Text('Details'),
//               key: ValueKey('details'),
//               initialText: controller.state.note.details,
//               onChange: controller.onDetailsChanged,
//               maxLines: null,
//               minLines: 4,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Status: ${controller.state.note.noteStatus.name}'),
//               FButton.icon(
//                 onPress: () => controller.onStatusToggled(),
//                 child: Icon(
//                   controller.state.note.noteStatus == NoteStatus.Complete
//                       ? FIcons.check
//                       : FIcons.clock,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               ...NoteType.values.map((type) {
//                 return Expanded(
//                   child: FButton.icon(
//                     style: type == controller.value.note.noteType
//                         ? FButtonStyle.primary()
//                         : FButtonStyle.outline(),
//                     key: ValueKey(type),
//                     onPress: () => controller.onTypeChanged(type),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(type.icon, size: 36),
//                         Icon(
//                           type == controller.state.note.noteType
//                               ? FIcons.checkCheck
//                               : FIcons.fileQuestionMark,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                   ).pad(
//                       // all: 2
//                       ),
//                 );
//               }),
//             ],
//           ),
//           NoteEditToolbar(),
//           SizedBox(height: 4),
//         ],
//       ),
//     );
//   }
// }

// extension on NoteType {
//   IconData get icon {
//     return switch (this) {
//       NoteType.normal => FIcons.notebook,
//       NoteType.images => FIcons.image,
//       NoteType.archives => FIcons.archive,
//       NoteType.trash => FIcons.delete,
//       NoteType.news => FIcons.newspaper,
//     };
//   }
// }

// class BottomSheetMenu extends StatelessWidget {
//   final List<Widget> actions;
//   BottomSheetMenu({super.key, this.actions = const []});
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisSize: MainAxisSize.min, children: actions);
//   }
// }
