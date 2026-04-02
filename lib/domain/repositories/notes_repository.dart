import 'package:notes/domain/models/note.dart';
import 'package:notes/objectbox.g.dart';

class CrudRepository<T> {
  late final Store store;
  late final box = store.box<T>();
  Future<void> put(T note) async {
    await box.put(note);
    // emit(box.getAll());
  }

  Future<void> remove(int id) async {
    await box.remove(id);
    // emit(box.getAll());
  }

  Future<void> removeAll() async {
    await box.removeAll();
    // emit(box.getAll());
  }

  T? getById(int id) => box.get(id);
}

final notesRepository = NotesRepository();

class NotesRepository extends CrudRepository<Note> {
  NotesRepository();

  Iterable<Note> notes(NoteType type) {
    return [];
  }

  void deletedAllNotes() {}

  Iterable<Note> get normals => notes(NoteType.normal);
  Iterable<Note> get images => notes(NoteType.images);
  Iterable<Note> get archives => notes(NoteType.archives);
  Iterable<Note> get trash => notes(NoteType.trash);
  Iterable<Note> get news => notes(NoteType.news);

  void delete(int id) {}
}
