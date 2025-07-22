import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:signals_flutter/signals_flutter.dart';

final hasChangesRM = signal(false);

void delete() {
  // notesRepository.remove(note().id!);
  cancel();
}

bool get hasChanges => hasChangesRM.value;

void save() {
  // notesRepository.put(note());
  hasChangesRM.value = false;
}

void cancel() async {
  navigator.back();
  // final _note = await notesRepository
  //     .getAll()
  //     .where((any) => any.id == note().id)
  //     .firstOrNull;
  // if (_note != null) notesRepository.put(_note);
}

void archive() {
  note.set(note()..noteType = NoteType.Archived);
  hasChangesRM.value = true;
}

void restoreAsNote() {
  note.set(note()..noteType = NoteType.NormalNote);
  hasChangesRM.value = true;
}

void restoreAsReminder() {
  note.set(note()..noteType = NoteType.ImageNotes);
  hasChangesRM.value = true;
}

void toggleStatus() {
  final _note = note();
  if (_note.isCompleted) {
    note.set(_note..noteStatus = NoteStatus.Incomplete);
  } else {
    note.set(_note..noteStatus = NoteStatus.Complete);
  }
  hasChangesRM.value = true;
}

String title([String? value]) {
  if (value != null) {
    final _value = note()..title = value;
    note.set(_value);
    hasChangesRM.value = true;
  }
  return note().title;
}

String details([String? value]) {
  if (value != null) {
    final _value = note()..details = value;
    note.set(_value);
    hasChangesRM.value = true;
  }
  return note().details;
}

class NotePage extends UI {
  NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FHeader.nested(
            title: Text(note().title),
            prefixes: [
              FButton.icon(
                onPress: navigator.back,
                child: Icon(FIcons.arrowLeft),
              ),
            ],
            suffixes: [
              FButton.icon(
                style: FButtonStyle.destructive(),
                onPress: hasChanges ? save : null,
                child: Icon(FIcons.save),
              ),
              FButton.icon(
                style: FButtonStyle.destructive(),
                onPress: delete,
                child: Icon(FIcons.delete),
              ),
            ],
          ),
          FTextField(
            label: Text('Title'),
            key: ValueKey('title'),
            initialText: note().title,
            onChange: title,
            maxLines: null,
          ),
          Expanded(
            child: FTextField(
              label: Text('Details'),
              key: ValueKey('details'),
              initialText: details(),
              onChange: details,
              maxLines: null,
              minLines: 4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status: ${note().noteStatus.name}'),
              FButton.icon(
                onPress: () {
                  toggleStatus();
                },
                child: Icon(
                  note().noteStatus == NoteStatus.Complete
                      ? FIcons.check
                      : FIcons.clock,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ...NoteType.values.map((type) {
                return Expanded(
                  child: FButton.icon(
                    style: type == note().noteType
                        ? FButtonStyle.primary()
                        : FButtonStyle.outline(),
                    key: ValueKey(type),
                    // enabled: note.noteType != type,
                    onPress: () {
                      note.set(note()..noteType = type);
                    },
                    // height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(type.icon, size: 36),
                        Icon(
                          type == note().noteType
                              ? FIcons.checkCheck
                              : FIcons.fileQuestionMark,
                          size: 20,
                        ),
                      ],
                    ),
                  ).pad(all: 2),
                );
              }),
            ],
          ),
          // Text('Created on: ${note.timeCreated}'),
          // Text('Due date: ${note.dueDate}'),
          NoteEditToolbar(),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}

extension on NoteType {
  IconData get icon => switch (this) {
        NoteType.NormalNote => FIcons.notebook,
        NoteType.ImageNotes => FIcons.image,
        NoteType.Archived => FIcons.archive,
        NoteType.Deleted => FIcons.delete,
        NoteType.New => FIcons.newspaper,
      };
}

class NoteEditToolbar extends UI {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FButton.icon(
          onPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheetMenu(
                actions: [
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Take a photo'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Add an image'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.draw),
                    title: Text('Drawing'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.mic),
                    title: Text('Recording'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.check_box),
                    title: Text('Checkboxes'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
          child: Icon(FIcons.plus),
        ).pad(),
        FButton.icon(
          onPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetMenu(
                  actions: [
                    "Colors".text(textScaleFactor: 2).pad(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Colors.primaries.map((color) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    "Backgrounds".text(textScaleFactor: 2).pad(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Colors.primaries.map((color) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(FIcons.thermometer),
        ).pad(),
        FButton.icon(
          onPress: () {},
          child: Icon(FIcons.textSearch),
        ).pad(),
        FButton.icon(
          onPress: () {
            // RM.navigate.toBottomSheet(BottomSheetMenu());
            showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheetMenu(
                actions: [
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete Note'),
                    onTap: () {
                      // notesRM.delete(state!);
                      Navigator.pop(context);
                      // noteBloc.delete();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.copy),
                    title: Text('Make a copy'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Send'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Collaborator'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.label),
                    title: Text('Labels'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Feedback'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
          child: Icon(FIcons.menu),
        ).pad(),
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
            .text()
            .pad(),
      ],
    );
  }
}

class BottomSheetMenu extends UI {
  final List<Widget> actions;
  BottomSheetMenu({super.key, this.actions = const []});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: actions);
  }
}
