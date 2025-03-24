import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:floor/floor.dart';
part 'note.g.dart';

@CopyWith()
@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id; // Primary key (auto-incremented)
  String title;
  String details;
  bool editing;
  bool isComplete;
  NoteStatus noteStatus;
  NoteType noteType;
  NoteType wasBefore;

  Note({
    this.id,
    this.title = '',
    this.details = '',
    this.noteStatus = NoteStatus.Incomplete,
    this.wasBefore = NoteType.New,
    this.noteType = NoteType.NormalNote,
    this.editing = false,
    this.isComplete = false,
  });

  bool get isReminder => noteType == NoteType.ImageNotes;
  bool get isNormalNote => noteType == NoteType.NormalNote;
  bool get idDeleted => noteType == NoteType.Deleted;
  bool get isArchived => noteType == NoteType.Archived;
  bool get isCompleted => noteStatus == NoteStatus.Complete;
  bool get isIncomplete => noteStatus == NoteStatus.Incomplete;
}

enum NoteStatus { Complete, Incomplete }

enum NoteType { NormalNote, ImageNotes, Archived, Deleted, New }
