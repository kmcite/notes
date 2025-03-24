import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/utils/navigator.dart';
import 'package:notes/utils/api.dart';
import 'package:states_rebuilder/scr/state_management/extensions/type_extensions.dart';

mixin class NoteBloc {
  final hasChangesRM = false.inj();
  Modifier<Note> get note => notesRepository.note;
  void delete() {
    notesRepository.deleter(note());
    cancel();
  }

  bool get hasChanges => hasChangesRM.state;

  void save() {
    notesRepository.inserter(note());
    hasChangesRM.state = false;
  }

  void cancel() async {
    navigator.back();
    final _note = await notesRepository.getNoteById(note().id!);
    if (_note != null) notesRepository.inserter(_note);
  }

  void archive() {
    note(note()..noteType = NoteType.Archived);
    hasChangesRM.state = true;
  }

  void restoreAsNote() {
    note(note()..noteType = NoteType.NormalNote);
    hasChangesRM.state = true;
  }

  void restoreAsReminder() {
    note(note()..noteType = NoteType.ImageNotes);
    hasChangesRM.state = true;
  }

  void toggleStatus() {
    final _note = note();
    if (_note.isCompleted) {
      note(_note..noteStatus = NoteStatus.Incomplete);
    } else {
      note(_note..noteStatus = NoteStatus.Complete);
    }
    hasChangesRM.state = true;
  }

  String title([String? value]) {
    if (value != null) {
      final _value = note()..title = value;
      note(_value);
      hasChangesRM.state = true;
    }
    return note().title;
  }

  String details([String? value]) {
    if (value != null) {
      final _value = note()..details = value;
      note(_value);
      hasChangesRM.state = true;
    }
    return note().details;
  }
}
