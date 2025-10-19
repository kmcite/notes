import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/features/notes/note/note.dart';
import 'package:notes/main.dart';

class NoteEditToolbarBloc extends Cubit<NoteEditToolbar> {
  @override
  Future<NoteEditToolbar> init() async => NoteEditToolbar();
}

class NoteEditToolbar extends Feature<NoteEditToolbarBloc> {
  @override
  NoteEditToolbarBloc create() => NoteEditToolbarBloc();

  @override
  Widget build(BuildContext context, controller) {
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
                    "Colors"
                        .text(
                            // textScaleFactor: 2
                            )
                        .pad(),
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
                    "Backgrounds"
                        .text(
                            // textScaleFactor: 2
                            )
                        .pad(),
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
