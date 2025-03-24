// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NoteCWProxy {
  Note id(int? id);

  Note title(String title);

  Note details(String details);

  Note noteStatus(NoteStatus noteStatus);

  Note wasBefore(NoteType wasBefore);

  Note noteType(NoteType noteType);

  Note editing(bool editing);

  Note isComplete(bool isComplete);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Note(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Note(...).copyWith(id: 12, name: "My name")
  /// ````
  Note call({
    int? id,
    String title,
    String details,
    NoteStatus noteStatus,
    NoteType wasBefore,
    NoteType noteType,
    bool editing,
    bool isComplete,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNote.copyWith.fieldName(...)`
class _$NoteCWProxyImpl implements _$NoteCWProxy {
  const _$NoteCWProxyImpl(this._value);

  final Note _value;

  @override
  Note id(int? id) => this(id: id);

  @override
  Note title(String title) => this(title: title);

  @override
  Note details(String details) => this(details: details);

  @override
  Note noteStatus(NoteStatus noteStatus) => this(noteStatus: noteStatus);

  @override
  Note wasBefore(NoteType wasBefore) => this(wasBefore: wasBefore);

  @override
  Note noteType(NoteType noteType) => this(noteType: noteType);

  @override
  Note editing(bool editing) => this(editing: editing);

  @override
  Note isComplete(bool isComplete) => this(isComplete: isComplete);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Note(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Note(...).copyWith(id: 12, name: "My name")
  /// ````
  Note call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? noteStatus = const $CopyWithPlaceholder(),
    Object? wasBefore = const $CopyWithPlaceholder(),
    Object? noteType = const $CopyWithPlaceholder(),
    Object? editing = const $CopyWithPlaceholder(),
    Object? isComplete = const $CopyWithPlaceholder(),
  }) {
    return Note(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as String,
      noteStatus: noteStatus == const $CopyWithPlaceholder()
          ? _value.noteStatus
          // ignore: cast_nullable_to_non_nullable
          : noteStatus as NoteStatus,
      wasBefore: wasBefore == const $CopyWithPlaceholder()
          ? _value.wasBefore
          // ignore: cast_nullable_to_non_nullable
          : wasBefore as NoteType,
      noteType: noteType == const $CopyWithPlaceholder()
          ? _value.noteType
          // ignore: cast_nullable_to_non_nullable
          : noteType as NoteType,
      editing: editing == const $CopyWithPlaceholder()
          ? _value.editing
          // ignore: cast_nullable_to_non_nullable
          : editing as bool,
      isComplete: isComplete == const $CopyWithPlaceholder()
          ? _value.isComplete
          // ignore: cast_nullable_to_non_nullable
          : isComplete as bool,
    );
  }
}

extension $NoteCopyWith on Note {
  /// Returns a callable class that can be used as follows: `instanceOfNote.copyWith(...)` or like so:`instanceOfNote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NoteCWProxy get copyWith => _$NoteCWProxyImpl(this);
}
