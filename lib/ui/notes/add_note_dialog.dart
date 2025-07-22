import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:signals_flutter/signals_flutter.dart';

final counterId = signal(0);

final noteToAdd = signal(Note());

void saveNote() {
  var id = counterId();
  while (notes.containsKey(id)) {
    id++;
  }

  noteToAdd.set(noteToAdd()..id = id);
  notes[id] = noteToAdd(); // optional: save it right away

  counterId.value = id + 1; // ensure future IDs move forward
  navigator.back();
}

class AddNoteDialog extends UI {
  @override
  Widget build(BuildContext context) {
    return FDialog(
      direction: Axis.horizontal,
      title: 'New Note'.text(),
      body: Column(
        children: [
          FTextField(
            label: 'name'.text(),
            initialText: noteToAdd().title,
            onChange: (value) {
              noteToAdd.set(noteToAdd()..title = value);
            },
            maxLines: 2,
          ).pad(),
          FTextField(
            label: 'details'.text(),
            initialText: noteToAdd().details,
            onChange: (value) {
              noteToAdd.set(noteToAdd()..details = value);
            },
            minLines: 4,
            maxLines: null,
          ).pad(),
        ],
      ),
      actions: [
        FButton.icon(
          style: FButtonStyle.primary(),
          onPress: saveNote,
          child: 'Okay'.text(),
        ),
        FButton.icon(
          style: FButtonStyle.destructive(),
          onPress: navigator.back,
          child: 'Cancel'.text(),
        ),
      ],
    );
  }
}
