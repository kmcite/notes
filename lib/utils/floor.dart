import 'dart:async';
import 'package:floor/floor.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) =>
      DateTime.fromMillisecondsSinceEpoch(databaseValue);
  @override
  int encode(DateTime value) => value.millisecondsSinceEpoch;
}

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> inserter(T item);

  @update
  Future<int> updater(T item);

  @delete
  Future<int> deleter(T item);
}
