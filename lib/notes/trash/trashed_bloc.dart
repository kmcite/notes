import '../../main.dart';

final TrashedRM trashedRM = TrashedRM();

class TrashedRM {
  Iterable<Note> get trashed => notesRepository.trashed;

  void restoreNote(Note note) {
    final was = note.was;
    notesRepository.put(
      note..noteType = was,
    );
  }

  void permanentlyDeleteNote(Note note) => notesRepository.remove(note.id);
  void deleteAll() => trashed.forEach(permanentlyDeleteNote);
}
