import 'package:notes/utils/model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Note extends Model {
  @override
  @Id()
  int id;
  String title;
  String details;
  bool editing;

  int statusIndex = 0;
  int typeIndex = 0;
  int wasBeforeIndex = 0;
  @Transient()
  NoteStatus get noteStatus => NoteStatus.values[statusIndex];
  set noteStatus(NoteStatus value) => statusIndex = value.index;
  @Transient()
  NoteType get noteType => NoteType.values[typeIndex];
  set noteType(NoteType value) => typeIndex = value.index;
  @Transient()
  NoteType get wasBefore => NoteType.values[wasBeforeIndex];
  set wasBefore(NoteType value) => wasBeforeIndex = value.index;
  @Property(type: PropertyType.date)
  DateTime timeCreated;

  Note({
    this.id = 0,
    this.title = '',
    this.details = '',
    this.editing = false,
  }) : timeCreated = DateTime.now();

  bool get isImage => noteType == NoteType.images;
  bool get isNormalNote => noteType == NoteType.normal;
  bool get idDeleted => noteType == NoteType.trash;
  bool get isArchived => noteType == NoteType.archives;
  bool get isCompleted => noteStatus == NoteStatus.Complete;
  bool get isIncomplete => noteStatus == NoteStatus.Incomplete;
}

enum NoteStatus { Complete, Incomplete }

enum NoteType { normal, images, archives, trash, news }
