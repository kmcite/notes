import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/main.dart';
import 'package:notes/domain/models/pages.dart';

class NewNoteBloc extends Cubit<Note> {
  late NotesRepository notesRepository = of();

  @override
  Future<Note> init() async => Note();

  void onNameChanged(String name) {
    emit(state..title = name);
  }

  void onDetailsChanged(String details) {
    emit(state..details = details);
  }

  void onNoteTypeChanged(NoteType noteType) {
    emit(state..noteType = noteType);
  }

  void onNoteSaved() {
    final note = Note(
      title: state.title,
      details: state.details,
    );
    notesRepository.put(note);
    onCancelled();
  }

  void onCancelled() {
    navigator.back();
  }
}

class NewNoteView extends Feature<NewNoteBloc> {
  @override
  NewNoteBloc create() => NewNoteBloc();

  @override
  Widget build(BuildContext context, controller) {
    return FDialog(
      direction: Axis.horizontal,
      title: 'New Note'.text(),
      body: Column(
        children: [
          FTextField(
            label: 'name'.text(),
            initialText: controller.state.title,
            onChange: (value) {
              controller.onNameChanged(value);
            },
            maxLines: 2,
          ).pad(),
          FTextField(
            label: 'details'.text(),
            initialText: controller.state.details,
            onChange: (value) {
              controller.onDetailsChanged(value);
            },
            minLines: 4,
            maxLines: null,
          ).pad(),
          Column(
            children: [
              for (final type in NoteType.values)
                FTile(
                  prefix: type == controller.state.noteType
                      ? Icon(FIcons.checkCheck)
                      : null,
                  title: Text(type.label),
                  suffix: Icon(type.icon),
                  onPress: () {
                    controller.onNoteTypeChanged(type);
                  },
                )
            ],
          ),
        ],
      ),
      actions: [
        FButton.icon(
          style: FButtonStyle.primary(),
          onPress: controller.onNoteSaved,
          child: 'Okay'.text(),
        ),
        FButton.icon(
          style: FButtonStyle.destructive(),
          onPress: controller.onCancelled,
          child: 'Cancel'.text(),
        ),
      ],
    );
  }
}
