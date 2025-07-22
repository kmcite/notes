import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:notes/ui/notes/add_note_dialog.dart';
import 'package:notes/ui/notes/image_notes/image_note_tile.dart';
import 'package:signals_flutter/signals_flutter.dart';

final imageNotes = computed(
  () => notes.values.where(
    (any) => any.noteType == NoteType.ImageNotes,
  ),
);

class ImageNotesPage extends UI {
  const ImageNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: ListView.builder(
        itemCount: imageNotes().length,
        itemBuilder: (context, index) {
          final note = imageNotes().elementAt(index);
          return FButton(
            onPress: () {
              // navigator.to(ImageNotePage());
            },
            child: ImageNoteTile(note: note),
          ).pad();
        },
      ),
      footer: FButton(
        onPress: () {
          final note = Note()
            ..id = counterId()
            ..noteType = NoteType.ImageNotes;
          notes[note.id!] = note;
        },
        child: Icon(Icons.add),
      ).pad(),
    );
  }
}
