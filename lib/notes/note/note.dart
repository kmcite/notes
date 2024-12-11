import 'package:notes/main.dart';

@Entity()
class Note {
  @Id(assignable: true)
  int id = 0;
  String title = '', details = '';

  DateTime dueDate = DateTime.now();
  DateTime timeCreated = DateTime.now();
  DateTime whenToRemind = DateTime.now();

  String status = NoteStatus.Incomplete.name;
  NoteStatus get noteStatus => NoteStatus.values.byName(status);
  set noteStatus(NoteStatus _value) => status = _value.name;

  String wasBefore = NoteType.New.name;
  NoteType get was => NoteType.values.byName(wasBefore);
  set was(NoteType value) => wasBefore = value.name;

  String type = NoteType.NormalNote.name;
  NoteType get noteType => NoteType.values.byName(type);
  set noteType(NoteType _value) => type = _value.name;

  bool get isReminder => this.noteType == NoteType.NormalReminder;
  bool get isNormalNote => this.noteType == NoteType.NormalNote;
  bool get idDeleted => this.noteType == NoteType.Deleted;
  bool get isArchived => this.noteType == NoteType.Archived;

  bool get isCompleted => this.status == NoteStatus.Complete;
  bool get isIncomplete => this.status == NoteStatus.Incomplete;

  bool get isOverdue => this.dueDate.isBefore(DateTime.now());
  bool get isDueToday =>
      this.dueDate.toLocal().day == DateTime.now().toLocal().day;
  bool get isDueTomorrow =>
      this.dueDate.toLocal().day == DateTime.now().toLocal().day + 1;
}

enum NoteStatus {
  Complete,
  Incomplete,
}

enum NoteType {
  NormalNote,
  NormalReminder,
  Archived,
  Deleted,
  New,
}
