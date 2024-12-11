import 'package:notes/main.dart';

final RemindersRM remindersRM = RemindersRM();

class RemindersRM {
  List<Note> get reminders => notesRepository.reminders;

  void put(Note note) {
    notesRepository.put(note..noteType = NoteType.NormalReminder);
  }
}
