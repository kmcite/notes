import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/main.dart';
import 'package:notes/ui/notes/add_note_dialog.dart';
import 'package:notes/ui/notes/notes.dart';
import 'package:notes/ui/notes/deleted/deleted_page.dart';
import 'package:notes/ui/settings/settings_page.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'archives/archives_page.dart';
import 'image_notes/image_notes_page.dart';

final index = signal(0);
final label = computed(() => Pages.values[index()].label);
final isDeletedPage = computed(() => Pages.values[index()] == Pages.deleted);
final isNotesPage = computed(() => Pages.values[index()] == Pages.notes);

class HomePage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: label.text(),
        // prefixes: [],
        suffixes: [
          if (isDeletedPage())
            FButton.icon(
              child: Icon(FIcons.delete),
              onPress: deleted().isEmpty ? null : () => deleteAll(),
            ),
          if (isNotesPage())
            FButton.icon(
              child: Icon(
                switch (viewMode()) {
                  ViewMode.grid => FIcons.grid2x2,
                  ViewMode.list => FIcons.list,
                },
              ),
              onPress: () => viewMode.set(
                switch (viewMode()) {
                  ViewMode.grid => ViewMode.list,
                  ViewMode.list => ViewMode.grid,
                },
              ),
            ),
          if (isNotesPage())
            FButton.icon(
              child: Icon(FIcons.plus),
              onPress: () {
                navigator.toDialog(AddNoteDialog());
              },
            ),
          FButton.icon(
            child: Icon(darkMode() ? FIcons.moon : FIcons.sun),
            onPress: () => darkMode.set(!darkMode()),
          ),
          FButton.icon(
            child: Icon(FIcons.settings),
            onPress: () => navigator.to(SettingsPage()),
          ),
        ],
      ),
      child: Pages.values[index()].page, // 'Pages.values[index()].page'.text(),
      footer: FBottomNavigationBar(
        index: index(),
        onChange: index.set,
        children: Pages.values.map(
          (page) {
            return FBottomNavigationBarItem(
              label: page.label.text(),
              icon: Icon(page.icon),
            );
          },
        ).toList(),
      ),
    );
  }
}

enum Pages { notes, archives, deleted, image }

extension on Pages {
  String get label => switch (this) {
        Pages.notes => 'Notes',
        Pages.archives => 'Archives',
        Pages.deleted => 'Deleted',
        Pages.image => 'Images',
      };
  IconData get icon => switch (this) {
        Pages.notes => FIcons.notebook,
        Pages.archives => FIcons.archive,
        Pages.deleted => FIcons.delete,
        Pages.image => FIcons.image,
      };

  // ignore: unused_element
  Widget get page => switch (this) {
        Pages.notes => NotesPage(),
        Pages.archives => ArchivesPage(),
        Pages.deleted => DeletedPage(),
        Pages.image => ImageNotesPage(),
      };
}

///
/// notes
/// archives
/// deleted-ones
/// image-based
