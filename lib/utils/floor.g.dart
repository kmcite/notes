// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NoteDao? _noteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `details` TEXT NOT NULL, `editing` INTEGER NOT NULL, `isComplete` INTEGER NOT NULL, `noteStatus` INTEGER NOT NULL, `noteType` INTEGER NOT NULL, `wasBefore` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NoteDao get noteDao {
    return _noteDaoInstance ??= _$NoteDao(database, changeListener);
  }
}

class _$NoteDao extends NoteDao {
  _$NoteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _noteInsertionAdapter = InsertionAdapter(
            database,
            'Note',
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'details': item.details,
                  'editing': item.editing ? 1 : 0,
                  'isComplete': item.isComplete ? 1 : 0,
                  'noteStatus': item.noteStatus.index,
                  'noteType': item.noteType.index,
                  'wasBefore': item.wasBefore.index
                },
            changeListener),
        _noteUpdateAdapter = UpdateAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'details': item.details,
                  'editing': item.editing ? 1 : 0,
                  'isComplete': item.isComplete ? 1 : 0,
                  'noteStatus': item.noteStatus.index,
                  'noteType': item.noteType.index,
                  'wasBefore': item.wasBefore.index
                },
            changeListener),
        _noteDeletionAdapter = DeletionAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'details': item.details,
                  'editing': item.editing ? 1 : 0,
                  'isComplete': item.isComplete ? 1 : 0,
                  'noteStatus': item.noteStatus.index,
                  'noteType': item.noteType.index,
                  'wasBefore': item.wasBefore.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Note> _noteInsertionAdapter;

  final UpdateAdapter<Note> _noteUpdateAdapter;

  final DeletionAdapter<Note> _noteDeletionAdapter;

  @override
  Stream<List<Note>> watch() {
    return _queryAdapter.queryListStream('SELECT * FROM Note',
        mapper: (Map<String, Object?> row) => Note(
            id: row['id'] as int?,
            title: row['title'] as String,
            details: row['details'] as String,
            noteStatus: NoteStatus.values[row['noteStatus'] as int],
            wasBefore: NoteType.values[row['wasBefore'] as int],
            noteType: NoteType.values[row['noteType'] as int],
            editing: (row['editing'] as int) != 0,
            isComplete: (row['isComplete'] as int) != 0),
        queryableName: 'Note',
        isView: false);
  }

  @override
  Future<List<Note>> getAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM Note',
        mapper: (Map<String, Object?> row) => Note(
            id: row['id'] as int?,
            title: row['title'] as String,
            details: row['details'] as String,
            noteStatus: NoteStatus.values[row['noteStatus'] as int],
            wasBefore: NoteType.values[row['wasBefore'] as int],
            noteType: NoteType.values[row['noteType'] as int],
            editing: (row['editing'] as int) != 0,
            isComplete: (row['isComplete'] as int) != 0));
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return _queryAdapter.query('SELECT * FROM Note WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Note(
            id: row['id'] as int?,
            title: row['title'] as String,
            details: row['details'] as String,
            noteStatus: NoteStatus.values[row['noteStatus'] as int],
            wasBefore: NoteType.values[row['wasBefore'] as int],
            noteType: NoteType.values[row['noteType'] as int],
            editing: (row['editing'] as int) != 0,
            isComplete: (row['isComplete'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<int> inserter(Note item) {
    return _noteInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updater(Note item) {
    return _noteUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleter(Note item) {
    return _noteDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
