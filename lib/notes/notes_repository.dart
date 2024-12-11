import 'package:notes/main.dart';

final notesRepository = NotesRepository();

class NotesRepository extends CRUD<Note> {
  late final notesRM = RM.injectStream(
    watch,
    initialState: getAll(),
  );
  List<Note> get all_notes => notesRM.state;
  List<Note> get notes => all_notes.where(
        (note) {
          return note.noteType == NoteType.NormalNote ||
              note.noteType == NoteType.New;
        },
      ).toList();
  List<Note> get archives =>
      all_notes.where((note) => note.noteType == NoteType.Archived).toList();
  List<Note> get reminders => all_notes
      .where((note) => note.noteType == NoteType.NormalReminder)
      .toList();
  List<Note> get trashed =>
      all_notes.where((note) => note.noteType == NoteType.Deleted).toList();
}
