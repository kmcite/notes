import 'package:alien_signals/alien_signals.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';

import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/models/pages.dart';
import 'package:notes/domain/repositories/navigator.dart';
import 'package:notes/domain/repositories/notes_repository.dart';

final newNoteName = signal('');
final newNoteDetails = signal('');
final newNoteType = signal(NoteType.normal);

void onNewNoteSaved() {
  final note = Note()
    ..title = newNoteName()
    ..details = newNoteDetails();
  notesRepository.put(note);
  pop();
}

class NewNoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FDialog(
      direction: Axis.horizontal,
      title: Text('New Note'),
      body: Column(
        children: [
          FTextField(
            label: Text('name'),
            control: .managed(
              initial: .new(text: newNoteName()),
              onChange: (value) => newNoteName.set(value.text),
            ),
            maxLines: 2,
          ),
          FTextField(
            label: Text('details'),
            control: .managed(
              initial: .new(text: newNoteDetails()),
              onChange: (value) => newNoteDetails.set(value.text),
            ),
            minLines: 4,
            maxLines: null,
          ),
          Column(
            children: [
              for (final type in NoteType.values)
                FTile(
                  prefix: type == newNoteType()
                      ? Icon(FIcons.checkCheck)
                      : null,
                  title: Text(type.label),
                  suffix: Icon(type.icon),
                  onPress: () => newNoteType.set(type),
                ),
            ],
          ),
        ],
      ),
      actions: [
        FButton.icon(onPress: onNewNoteSaved, child: Text('Okay')),
        FButton.icon(onPress: pop, child: Text('Cancel')),
      ],
    );
  }
}
