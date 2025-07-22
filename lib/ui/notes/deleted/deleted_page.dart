import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:signals_flutter/signals_flutter.dart';

final deleted = computed(
  () => notes.values.where(
    (any) => any.noteType == NoteType.Deleted,
  ),
);

void restoreNote(Note note) {
  // final was = note.was;
  // notesRepository.put(note..noteType = was);
  // emit(trashed);
}

void permanentlyDeleteNote(Note note) => notes.remove(note.id);

void deleteAll() {
  notes.clear();
}

class DeletedPage extends UI {
  const DeletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: deleted().isEmpty
          ? Icon(
              FIcons.delete,
              size: 96,
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                  color: Theme.of(context).primaryColor),
              itemCount: deleted().length,
              itemBuilder: (context, index) {
                final note = deleted().elementAt(index);
                return FTile(
                  title: Text(note.title),
                  subtitle: Text(note.details),
                  prefix: IconButton(
                    tooltip: "Restore",
                    icon: Icon(FIcons.archiveRestore),
                    onPressed: () {
                      restoreNote(note);
                    },
                  ).pad(right: 8),
                  suffix: IconButton(
                    tooltip: "Permanently Delete",
                    icon: Icon(FIcons.delete),
                    onPressed: () {
                      permanentlyDeleteNote(note);
                    },
                  ).pad(right: 8),
                ).pad();
              },
            ),
    );
  }
}
