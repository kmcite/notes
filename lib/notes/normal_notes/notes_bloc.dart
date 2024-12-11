import 'package:notes/main.dart';

final NotesRM notesRM = NotesRM();

class NotesRM {
  List<Note> get notes => notesRepository.notes;

  void note(Note note) {
    notesRepository.put(note);
  }

  void delete(Note note) {
    final was = note.was;
    notesRepository.put(
      note
        ..noteType = NoteType.Deleted
        ..was = was,
    );
    navigationRepository.navigateTo(Pages.notes);
  }

  void archive(Note note) {
    final was = note.was;
    notesRepository.put(
      note
        ..noteType = NoteType.Archived
        ..was = was,
    );
  }
}
