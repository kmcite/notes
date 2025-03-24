import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/main.dart';
import 'package:notes/utils/api.dart';
import 'package:notes/utils/navigator.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

mixin AddNoteBloc {
  final noteRM = RM.inject(() => Note());
  Note note([Note? value]) {
    if (value != null) {
      noteRM
        ..state = value
        ..notify();
    }
    return noteRM.state;
  }

  void save() {
    notesRepository.inserter(note());
    cancel();
  }

  void cancel() {
    navigator.back();
  }
}

class AddNoteDialog extends UI with AddNoteBloc {
  @override
  Widget build(BuildContext context) {
    return FDialog(
      direction: Axis.horizontal,
      title: 'New Note'.text(),
      body: Column(
        children: [
          FTextField(
            label: 'name'.text(),
            initialValue: note().title,
            onChange: (value) {
              note(note().copyWith(title: value));
            },
            maxLines: 2,
          ).pad(),
          FTextField(
            label: 'details'.text(),
            initialValue: note().details,
            onChange: (value) {
              note(note().copyWith(details: value));
            },
            minLines: 4,
            maxLines: null,
          ).pad(),
        ],
      ),
      actions: [
        FButton.icon(
          style: FButtonStyle.primary,
          onPress: save,
          child: 'Okay'.text(),
        ),
        FButton.icon(
          style: FButtonStyle.destructive,
          onPress: cancel,
          child: 'Cancel'.text(),
        ),
      ],
    );
  }
}
