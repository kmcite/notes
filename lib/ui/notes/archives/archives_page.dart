import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/main.dart';
import 'package:signals_flutter/signals_core.dart';

import '../../../domain/models/note.dart';

void unArchiveNote(Note note) {
  final was = note.wasBefore;
  notes[note.id!] = note..noteType = was;
}

final archived = computed(
  () => notes.values.where(
    (any) => any.noteType == NoteType.Archived,
  ),
);

class ArchivesPage extends UI {
  const ArchivesPage({super.key});

  @override
  Widget build(context) {
    return FScaffold(
      child: archived().isEmpty
          ? Icon(
              FIcons.archive,
              size: 96,
            )
          : ListView.builder(
              itemCount: archived().length,
              itemBuilder: (context, index) {
                final note = archived().elementAt(index);
                return FTile(
                  title: Text(note.title),
                  suffix: IconButton(
                    icon: Icon(Icons.unarchive),
                    onPressed: () => unArchiveNote(note),
                  ),
                );
              },
            ),
    );
  }
}
