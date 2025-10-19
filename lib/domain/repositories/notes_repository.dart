import 'package:notes/domain/models/note.dart';
import 'package:notes/objectbox.g.dart';
import 'package:spark/spark.dart';

class CrudRepository<T> extends Repository<List<T>> {
  late final store = of<Store>();
  late final box = store.box<T>();
  @override
  List<T> get initialState => box.getAll();
  Future<void> put(T note) async {
    await box.put(note);
    emit(box.getAll());
  }

  Future<void> remove(int id) async {
    await box.remove(id);
    emit(box.getAll());
  }

  Future<void> removeAll() async {
    await box.removeAll();
    emit(box.getAll());
  }

  T? getById(int id) => box.get(id);
}

class NotesRepository extends CrudRepository<Note> {
  NotesRepository();

  Iterable<Note> notes(NoteType type) {
    return state.where(
      (note) => note.noteType == type,
    );
  }

  Iterable<Note> get normals => notes(NoteType.normal);
  Iterable<Note> get images => notes(NoteType.images);
  Iterable<Note> get archives => notes(NoteType.archives);
  Iterable<Note> get trash => notes(NoteType.trash);
  Iterable<Note> get news => notes(NoteType.news);
}
