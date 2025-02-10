import 'package:notes/main.dart';

final archivesRM = ArchivesRM();

class ArchivesRM {
  List<Note> get archives => notesRM.allNotes.where(
        (note) {
          return note.noteType == NoteType.Archived;
        },
      ).toList();

  void unArchive(Note note) {
    final was = note.was;
    notesRepository.put(note..noteType = was);
  }
}
