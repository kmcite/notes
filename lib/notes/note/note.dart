import 'package:notes/main.dart';

@Entity()
class Note {
  @Id(assignable: true)
  int id = 0;
  String title = '', details = '';

  @Property(type: PropertyType.date)
  DateTime dueDate = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime timeCreated = DateTime.now();
  @Property(type: PropertyType.date)
  DateTime whenToRemind = DateTime.now();

  String status = NoteStatus.Incomplete.name;

  @Transient()
  NoteStatus get noteStatus => NoteStatus.values.byName(status);
  @Transient()
  set noteStatus(NoteStatus _value) => status = _value.name;

  String wasBefore = NoteType.New.name;
  @Transient()
  NoteType get was => NoteType.values.byName(wasBefore);
  set was(NoteType value) => wasBefore = value.name;
  String type = NoteType.NormalNote.name;
  @Transient()
  NoteType get noteType => NoteType.values.byName(type);
  @Transient()
  set noteType(NoteType _value) => type = _value.name;
  @Transient()
  bool get isReminder => this.noteType == NoteType.NormalReminder;
  @Transient()
  bool get isNormalNote => this.noteType == NoteType.NormalNote;
  @Transient()
  bool get idDeleted => this.noteType == NoteType.Deleted;
  @Transient()
  bool get isArchived => this.noteType == NoteType.Archived;
  @Transient()
  bool get isCompleted => this.noteStatus == NoteStatus.Complete;
  @Transient()
  bool get isIncomplete => this.noteStatus == NoteStatus.Incomplete;

  @Transient()
  bool get isOverdue => this.dueDate.isBefore(DateTime.now());
  @Transient()
  bool get isDueToday =>
      this.dueDate.toLocal().day == DateTime.now().toLocal().day;
  @Transient()
  bool get isDueTomorrow =>
      this.dueDate.toLocal().day == DateTime.now().toLocal().day + 1;

  @override
  String toString() {
    return '''
Note ID: $id
Title: $title
Details: $details
Due Date: ${dueDate.toLocal()}
Time Created: ${timeCreated.toLocal()}
When To Remind: ${whenToRemind.toLocal()}
Status: ${noteStatus.toString()}
Was: ${was.toString()}
Type: ${noteType.toString()}
Is Reminder: $isReminder
Is Normal Note: $isNormalNote
Is Deleted: $idDeleted
Is Archived: $isArchived
Is Completed: $isCompleted
Is Incomplete: $isIncomplete
Is Overdue: $isOverdue
Is Due Today: $isDueToday
Is Due Tomorrow: $isDueTomorrow
''';
  }
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
