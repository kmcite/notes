import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:notes/utils/navigator.dart';
import 'package:notes/ui/notes/note/note_bloc.dart';
import 'package:notes/utils/api.dart';

class NotePage extends UI with NoteBloc {
  NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      content: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FHeader.nested(
            title: Text(note().title),
            prefixActions: [
              FButton.icon(
                onPress: navigator.back,
                child: FIcon(FAssets.icons.arrowLeft),
              ),
            ],
            suffixActions: [
              FButton.icon(
                style: FButtonStyle.destructive,
                onPress: hasChanges ? save : null,
                child: FIcon(FAssets.icons.save),
              ),
              FButton.icon(
                style: FButtonStyle.destructive,
                onPress: delete,
                child: FIcon(FAssets.icons.delete),
              ),
            ],
          ),
          FTextField(
            label: Text('Title'),
            key: ValueKey('title'),
            initialValue: note().title,
            onChange: title,
            maxLines: null,
          ),
          Expanded(
            child: FTextField(
              label: Text('Details'),
              key: ValueKey('details'),
              initialValue: details(),
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
                child: FIcon(
                  note().noteStatus == NoteStatus.Complete
                      ? FAssets.icons.check
                      : FAssets.icons.clock,
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
                        ? FButtonStyle.primary
                        : FButtonStyle.outline,
                    key: ValueKey(type),
                    // enabled: note.noteType != type,
                    onPress: () {
                      note(note()..noteType = type);
                    },
                    // height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FIcon(type.icon, size: 36),
                        FIcon(
                          type == note().noteType
                              ? FAssets.icons.checkCheck
                              : FAssets.icons.fileQuestion,
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
  SvgAsset get icon => switch (this) {
        NoteType.NormalNote => FAssets.icons.notebook,
        NoteType.ImageNotes => FAssets.icons.image,
        NoteType.Archived => FAssets.icons.archive,
        NoteType.Deleted => FAssets.icons.delete,
        NoteType.New => FAssets.icons.newspaper,
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
          child: FIcon(FAssets.icons.plus),
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
          child: FIcon(FAssets.icons.thermometer),
        ).pad(),
        FButton.icon(
          onPress: () {},
          child: FIcon(FAssets.icons.textSearch),
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
          child: FIcon(FAssets.icons.menu),
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
