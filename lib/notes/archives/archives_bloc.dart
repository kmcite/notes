import 'package:notes/main.dart';

final archivesRM = ArchivesRM();

class ArchivesRM {
  List<Note> get archives => notesRepository.archives;

  void unArchive(Note note) {
    final was = note.was;
    notesRepository.put(note..noteType = was);
  }
}
