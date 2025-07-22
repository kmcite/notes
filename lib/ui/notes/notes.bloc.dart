part of 'notes.dart';

void archiveNote(Note note) {
  final type = note.noteType;
  notes[note.id!] = note
    ..noteType = NoteType.Archived
    ..wasBefore = type;
}

void deleteNote(Note note) {
  final type = note.noteType;
  notes[note.id!] = note
    ..noteType = NoteType.Deleted
    ..wasBefore = type;
}

void gotoNote(Note _note) {
  note.set(_note);
  navigator.to(NotePage());
}

final normalNotes = computed(
  () => notes.values.where(
    (note) => note.noteType == NoteType.NormalNote,
  ),
);
