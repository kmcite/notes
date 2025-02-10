import 'package:notes/main.dart';

final noteBloc = NoteBloc();

class NoteBloc {
  final notesRM = RM.injectStream<List<Note>>(
    () => notesRepository.watch(),
    initialState: notesRepository.getAll(),
  );

  Note note(int id) {
    return notesRM.state.firstWhere(
      (any) {
        return any.id == id;
      },
    );
  }

  NotesRepository get _notesRepository => notesRepository;
  final noteRM = RM.inject<Note?>(() => null);

  void emit(Note? note) {
    _notesRepository.put(note!);
    noteRM
      ..state = note
      ..notify();
  }

  Note? get state => noteRM.state;

  void delete() => emit(state?..noteType = NoteType.Deleted);
  void archive() => emit(state?..noteType = NoteType.Archived);
  void restoreAsNote() => emit(state?..noteType = NoteType.NormalNote);
  void restoreAsReminder() => emit(state?..noteType = NoteType.NormalReminder);

  void toggleStatus(int id) {
    final _note = note(id);
    if (_note.isCompleted) {
      put(_note..noteStatus = NoteStatus.Incomplete);
    } else {
      put(_note..noteStatus = NoteStatus.Complete);
    }
  }

  void put(Note note) => _notesRepository.put(note);
}
