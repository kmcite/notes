import 'package:notes/main.dart';

final notesRepository = NotesRepository();

class NotesRepository with CRUD<Note> {}
