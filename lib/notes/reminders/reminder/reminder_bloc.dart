import '../../../main.dart';

class ReminderBloc extends Cubit<Note?> {
  ReminderBloc() : super(null);
  void load(int id) {
    final note = notesRepository.get(id);
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
