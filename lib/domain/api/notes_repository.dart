import 'package:floor/floor.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/utils/api.dart';
import 'package:notes/utils/floor.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final notesRepository = database.noteDao;

@dao
abstract class NoteDao extends BaseDao<Note> {
  @Query('SELECT * FROM Note')
  Stream<List<Note>> watch();
  @Query('SELECT * FROM Note')
  Future<List<Note>> getAllNotes();

  @Query('SELECT * FROM Note WHERE id = :id')
  Future<Note?> getNoteById(int id);
}

final noteRM = RM.inject(() => Note());

extension NoteDaoX on NoteDao {
  Note note([Note? value]) {
    if (value != null)
      noteRM
        ..state = value
        ..notify();
    return noteRM.state;
  }

  @transaction
  Future<void> deleteAll() async {
    final notes = await getAllNotes();
    for (var note in notes) {
      await deleter(note);
    }
  }
}
