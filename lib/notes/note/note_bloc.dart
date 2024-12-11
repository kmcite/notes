import 'package:notes/main.dart';

class NoteBloc extends Cubit<Note?> {
  NoteBloc() : super(null);
  void load(int id) {
    final note = notesRepository.byId(id);
    emit(note);
  }

  void submitToSave(Note note) {
    notesRepository.put(note);
    emit(note);
  }

  void delete() => emit(state?..noteType = NoteType.Deleted);
  void archive() => emit(state?..noteType = NoteType.Archived);
  void restoreAsNote() => emit(state?..noteType = NoteType.NormalNote);
  void restoreAsReminder() => emit(state?..noteType = NoteType.NormalReminder);

  void unload() => emit(null);
}
