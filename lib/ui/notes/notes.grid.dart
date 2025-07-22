import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/ui/notes/notes.dart';

import '../../main.dart';

class NotesGrid extends UI {
  @override
  Widget build(BuildContext context) {
    return normalNotes().isEmpty
        ? Icon(
            FIcons.notebookPen,
            size: 96,
          )
        : GridView.builder(
            itemCount: normalNotes().length,
            itemBuilder: (context, index) {
              final note = normalNotes().elementAt(index);
              return FLabel(
                label: note.title.text(),
                child: note.details.text(),
                axis: Axis.vertical,
                description: FButton.icon(
                  onPress: () => gotoNote(note),
                  child: Icon(FIcons.info),
                ),
              ).pad();
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
  }
}
