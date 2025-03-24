import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/ui/notes/add_note_dialog.dart';
import 'package:notes/ui/notes/note/note_page.dart';
import 'package:notes/ui/settings/settings_page.dart';
import 'package:notes/utils/api.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../utils/navigator.dart';

mixin class NotesBloc {
  late final notesRM = RM.injectStream(
    notesRepository.watch,
    initialState: <Note>[],
  );
  Iterable<Note> get notes => notesRM.state;
  ViewMode mode([ViewMode? value]) {
    if (value != null) {
      viewModeRepository.state = value;
    }
    return viewModeRepository.state;
  }

  void archive(Note note) {
    put(
      note
        ..noteType = NoteType.Archived
        ..wasBefore = NoteType.NormalNote,
    );
  }

  void delete(Note note) {
    put(
      note
        ..noteType = NoteType.Deleted
        ..wasBefore = NoteType.NormalNote,
    );
  }

  void put(Note note) {
    notesRepository.inserter(note);
  }

  void toggleViewMode() {
    mode(mode() == ViewMode.grid ? ViewMode.list : ViewMode.grid);
  }

  void toggleDark() {
    darkRepository.state = !dark;
  }

  bool get dark => darkRepository.state;
  void gotoNote(Note _note) {
    notesRepository.note(_note);
    navigator.to(NotePage());
  }
}

class NotesPage extends UI with NotesBloc {
  NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FHeader.nested(
          title: Text('Notes'),
          prefixActions: [
            FButton.icon(
              child: FIcon(FAssets.icons.settings),
              onPress: () => navigator.to(SettingsPage()),
            ),
            FButton.icon(
              child: FIcon(
                dark ? FAssets.icons.moon : FAssets.icons.sun,
              ),
              onPress: () => toggleDark(),
            ),
          ],
          suffixActions: [
            FButton.icon(
              child: FIcon(
                mode() == ViewMode.grid
                    ? FAssets.icons.grid2x2
                    : FAssets.icons.list,
              ),
              onPress: () => toggleViewMode(),
            ),
            FButton.icon(
              child: FIcon(FAssets.icons.plus),
              onPress: () {
                navigator.toDialog(AddNoteDialog());
              },
            ),
          ],
        ),
        switch (mode()) {
          ViewMode.list => NotesList(),
          ViewMode.grid => NotesGrid(),
        },
        // Expanded(
        //   child: loading
        //       ? CircularProgressIndicator().center()
        //       : switch (mode()) {
        //           ViewMode.list => FTileGroup.builder(
        //               count: notesRM.state.length,
        //               tileBuilder: (context, index) {
        //                 final note = notesRM.state.elementAt(index);
        //                 return Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     if (note.title.isNotEmpty)
        //                       FButton(
        //                         label: Text(
        //                           note.title,
        //                           style: const TextStyle(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 18,
        //                           ),
        //                           maxLines: 2,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                         onPress: () {},
        //                       ),
        //                     const SizedBox(height: 8),
        //                     Text(
        //                       note.details,
        //                       maxLines: null,
        //                       overflow: TextOverflow.fade,
        //                     ),
        //                     Row(
        //                       spacing: 8,
        //                       children: [
        //                         FButton.icon(
        //                           onPress: () {
        //                             archive(note);
        //                             print(note.id);
        //                           },
        //                           child: FIcon(FAssets.icons.archive),
        //                         ),
        //                         FButton.icon(
        //                           onPress: () {
        //                             // TODO this dependency does not belong here
        //                             // context.of<NoteBloc>().set(note);
        //                             // context.of<NavigationBloc>().to(NotePage());
        //                           },
        //                           child: FIcon(FAssets.icons.info),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 );
        //               },
        //             ),
        //           ViewMode.grid => Builder(
        //               builder: (context) {
        //                 return ListView.builder(
        //                   itemCount: notesRM.state.length,
        //                   itemBuilder: (context, index) {
        //                     final note = notesRM.state.elementAt(index);
        //                     return Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           note.title,
        //                           style: const TextStyle(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 18,
        //                           ),
        //                           maxLines: 2,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                         Text(
        //                           note.details,
        //                           maxLines: null,
        //                           overflow: TextOverflow.fade,
        //                         ),
        //                         Row(
        //                           spacing: 8,
        //                           children: [
        //                             FButton.icon(
        //                               style: FButtonStyle.primary,
        //                               onPress: () {
        //                                 // TODO this dependency does not belong here
        //                                 // context.of<NoteBloc>().set(note);
        //                                 // context.of<NavigationBloc>().to(NotePage());
        //                               },
        //                               child: FIcon(FAssets.icons.info),
        //                             ),
        //                             FButton.icon(
        //                               style: FButtonStyle.secondary,
        //                               onPress: () {
        //                                 // context.of<NotesBloc>().archive(note);
        //                                 print(note.id);
        //                               },
        //                               child: FIcon(FAssets.icons.archive),
        //                             ),
        //                             FButton.icon(
        //                               style: FButtonStyle.destructive,
        //                               onPress: () {
        //                                 // context.of<NotesBloc>().delete(note);
        //                                 print(note.id);
        //                               },
        //                               child: FIcon(FAssets.icons.delete),
        //                             ),
        //                           ],
        //                         ).pad(),
        //                       ],
        //                     );
        //                   },
        //                 );
        //               },
        //             ),
        //         },
        // ),
      ],
    );
  }
}

enum ViewMode { list, grid }

class NotesList extends UI with NotesBloc {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FTileGroup.builder(
        divider: FTileDivider.full,
        count: notes.length,
        tileBuilder: (context, index) {
          final note = notes.elementAt(index);
          return FTile(
            title: note.title.text(),
            subtitle: note.details.text(),
            onPress: () => gotoNote(note),
          );
        },
      ),
    );
  }
}

class NotesGrid extends UI with NotesBloc {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes.elementAt(index);
          return FLabel(
            label: note.title.text(),
            child: note.details.text(),
            axis: Axis.vertical,
            description: FButton.icon(
              onPress: () => gotoNote(note),
              child: FIcon(FAssets.icons.info),
            ),
          ).pad();
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
