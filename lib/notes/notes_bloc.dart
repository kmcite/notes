import 'package:notes/main.dart';

final NotesRM notesRM = NotesRM();

class NotesRM {
  ///  STREAMING ARCHITECTURE
  final notesRM = RM.injectStream<List<Note>>(
    () => notesRepository.watch(),
    initialState: notesRepository.getAll(),
  );

  List<Note> get allNotes => notesRM.state;

  List<Note> get notes {
    return allNotes.where(
      (note) {
        return note.isNormalNote;
      },
    ).toList();
  }

  Note get(int id) => notesRM.state.firstWhere((any) => any.id == id);

  bool get loading => notesRM.isWaiting;
  void note(Note note) async {
    notesRepository.put(note);
  }

  void delete(Note note) async {
    final was = note.was;
    notesRepository.put(
      note
        ..noteType = NoteType.Deleted
        ..was = was,
    );
    navigationRepository.navigateTo(Pages.notes);
  }

  void archive(int id) async {
    notesRM.setToIsWaiting();
    final note = get(id);
    final was = note.was;
    notesRepository.put(
      note
        ..noteType = NoteType.Archived
        ..was = was,
    );
    print(note);
  }

  void removeAll() => notesRepository.removeAll();
}
