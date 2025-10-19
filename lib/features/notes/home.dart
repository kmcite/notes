import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/configuration.dart';
import 'package:notes/domain/repositories/configuration_repository.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/models/view_mode.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/features/notes/new_note.dart';
import 'package:notes/main.dart';
import 'package:notes/domain/models/pages.dart';
import 'package:notes/features/settings/settings.dart';

class HomeState {
  NoteType type = NoteType.normal;
  Configuration configuration = Configuration();
  Iterable<Note> deleted = [];
}

class HomeBloc extends Cubit<HomeState> {
  late ConfigurationRepository configurationRepository = of();
  late NotesRepository notesRepository = of();

  init() async {
    configurationRepository.stream.listen(
      (configuration) => emit(state..configuration = configuration),
    );
    notesRepository.stream.listen(
      (_) => emit(state..deleted = notesRepository.trash),
    );
    return HomeState();
  }

  /// DERIVED
  ViewMode get mode => state.configuration.mode;
  bool get dark => state.configuration.dark;
  int get index => state.type.index;
  String get label => state.type.label;
  bool get isDeletedPage => state.type == NoteType.trash;
  bool get isNotesPage => state.type == NoteType.normal;

  /// MUTATIONS
  void onTypeChanged(NoteType type) {
    emit(state..type = type);
  }

  void onModeChanged(ViewMode mode) {
    configurationRepository.setMode(mode);
  }

  void onDarkToggled() {
    configurationRepository.setDark(!state.configuration.dark);
  }

  /// this removes all notes from the trash -> permanently
  void onDeleteAllPermanently() {
    for (final note in notesRepository.trash) {
      notesRepository.remove(note.id);
    }
    emit(state..deleted = notesRepository.trash);
  }
}

class HomePage extends Feature<HomeBloc> {
  @override
  HomeBloc create() => HomeBloc();

  @override
  Widget build(context, controller) {
    return FScaffold(
      header: FHeader(
        title: controller.label.text(),
        suffixes: [
          if (controller.isDeletedPage)
            FButton.icon(
              child: Icon(FIcons.delete),
              onPress: controller().deleted.isEmpty
                  ? null
                  : () => controller.onDeleteAllPermanently(),
            ),
          if (controller.isNotesPage)
            FButton.icon(
              child: Icon(
                switch (controller.mode) {
                  ViewMode.grid => FIcons.grid2x2,
                  ViewMode.list => FIcons.list,
                },
              ),
              onPress: () {
                controller.onModeChanged(
                  switch (controller.mode) {
                    ViewMode.grid => ViewMode.list,
                    ViewMode.list => ViewMode.grid,
                  },
                );
              },
            ),
          if (controller.isNotesPage)
            FButton.icon(
              child: Icon(FIcons.plus),
              onPress: () => navigator.toDialog(NewNoteView()),
            ),
          FButton.icon(
            child: Icon(controller.dark ? FIcons.moon : FIcons.sun),
            onPress: controller.onDarkToggled,
          ),
          FButton.icon(
            child: Icon(FIcons.settings),
            onPress: () => navigator.to(SettingsView()),
          ),
        ],
      ),
      child: controller.state.type.page,
      footer: FBottomNavigationBar(
        index: controller.index,
        onChange: (index) {
          controller.onTypeChanged(
            NoteType.values.elementAt(index),
          );
        },
        children: NoteType.values.map(
          (type) {
            return FBottomNavigationBarItem(
              label: type.label.text(),
              icon: Icon(
                type.icon,
                color: type == NoteType.trash ? Colors.red : null,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
