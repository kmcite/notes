import 'package:notes/main.dart';

final RemindersRM remindersRM = RemindersRM();

class RemindersRM {
  Iterable<Note> get reminders =>
      notesRM.allNotes.where((any) => any.noteType == NoteType.NormalReminder);

  void put(Note note) {
    notesRepository.put(note..noteType = NoteType.NormalReminder);
  }
}
