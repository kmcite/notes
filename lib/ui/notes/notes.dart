import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/ui/notes/note/note_page.dart';
import 'package:notes/ui/notes/notes.grid.dart';
import 'package:signals_flutter/signals_flutter.dart';

part 'notes.bloc.dart';
part 'notes.list.dart';

class NotesPage extends UI {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return switch (viewMode()) {
      ViewMode.list => NotesList(),
      ViewMode.grid => NotesGrid(),
    };
  }
}

enum ViewMode { list, grid }
