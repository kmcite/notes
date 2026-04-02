import 'package:alien_signals/alien_signals.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import 'package:notes/domain/models/available_themes.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/models/pages.dart';
import 'package:notes/domain/models/view_mode.dart';
import 'package:notes/domain/repositories/navigator.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/features/notes/new_note.dart';
import 'package:notes/features/settings/settings.dart';

final typeSignal = signal(NoteType.normal);
void onTypeChanged(NoteType type) {
  typeSignal.set(type);
}

final deletedNotesSignal = signal<Iterable<Note>>([]);

final isDeletedPageComputed = computed((_) => typeSignal() == NoteType.trash);
final isNotesPageComputed = computed((_) => typeSignal() == NoteType.normal);
void deleteAllPermanently() {
  for (final s in deletedNotesSignal()) {
    notesRepository.delete(s.id);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return FScaffold(
      header: FHeader(
        title: Text(typeSignal().label),
        suffixes: [
          if (isDeletedPageComputed())
            FButton.icon(
              child: Icon(FIcons.delete),
              onPress: deletedNotesSignal().isEmpty
                  ? null
                  : () => deleteAllPermanently(),
            ),
          if (isNotesPageComputed())
            FButton.icon(
              child: Icon(switch (viewModeSignal()) {
                ViewMode.grid => FIcons.grid2x2,
                ViewMode.list => FIcons.list,
              }),
              onPress: () {
                onViewModeChanged(switch (viewModeSignal()) {
                  ViewMode.grid => ViewMode.list,
                  ViewMode.list => ViewMode.grid,
                });
              },
            ),
          if (isNotesPageComputed())
            FButton.icon(
              child: Icon(FIcons.plus),
              onPress: () => pushDialog(NewNoteView()),
            ),
          FButton.icon(
            child: Icon(darkSignal() ? FIcons.moon : FIcons.sun),
            onPress: onDarkToggled,
          ),
          FButton.icon(
            child: Icon(FIcons.settings),
            onPress: () => push(SettingsView()),
          ),
        ],
      ),
      child: Container(),
      footer: FBottomNavigationBar(
        index: typeSignal().index,
        onChange: (index) {
          onTypeChanged(NoteType.values.elementAt(index));
        },
        children: NoteType.values.map((type) {
          return FBottomNavigationBarItem(
            label: Text(type.label),
            icon: Icon(
              type.icon,
              color: type == NoteType.trash ? Colors.red : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}
