import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/available_themes.dart';
import 'package:notes/domain/models/configuration.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/repositories/configuration_repository.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/main.dart';

typedef Themes = ({FThemeData dark, FThemeData light});

typedef SettingsState = ({Iterable<Note> notes, Configuration configuration});

class SettingsEvents {}

class SettingsStarted extends SettingsEvents {}

class UserNameChanged extends SettingsEvents {
  final String userName;

  UserNameChanged({required this.userName});
}

class DarkToggled extends SettingsEvents {
  final bool dark;

  DarkToggled({required this.dark});
}

class ThemeChanged extends SettingsEvents {
  final Themes theme;

  ThemeChanged({required this.theme});
}

class DeleteAllNotes extends SettingsEvents {}

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  late NotesRepository notesRepository = of();
  late ConfigurationRepository configurationRepository = of();
  @override
  Future<SettingsState> init() async {
    on<SettingsStarted>(
      (event, emit) async {
        await emit.forEach(
          configurationRepository.stream,
          onData: (configuration) {
            return (notes: state.notes, configuration: configuration);
          },
        );
        await emit.forEach(
          notesRepository.stream,
          onData: (notes) {
            return (notes: notes, configuration: state.configuration);
          },
        );
      },
    );
    on<UserNameChanged>(_onUserNameChanged);
    on<DarkToggled>(_onDarkToggled);
    on<ThemeChanged>(_onThemeChanged);
    on<DeleteAllNotes>(_onDeleteAllNotes);

    add(SettingsStarted());
    return (notes: <Note>[], configuration: Configuration());
  }

  void _onUserNameChanged(UserNameChanged event, emit) {
    configurationRepository.setUserName(event.userName);
  }

  void _onDarkToggled(DarkToggled event, emit) {
    configurationRepository.setDark(!event.dark);
  }

  void _onThemeChanged(ThemeChanged event, emit) {
    configurationRepository.setTheme(event.theme);
  }

  void _onDeleteAllNotes(DeleteAllNotes event, emit) {
    notesRepository.removeAll();
  }

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}

class SettingsView extends Feature<SettingsBloc> {
  SettingsView({super.key});

  @override
  SettingsBloc create() => SettingsBloc();

  @override
  Widget build(BuildContext context, controller) {
    return FScaffold(
      header: FHeader.nested(
        title: 'SETTINGS'.text(),
        prefixes: [
          FButton.icon(
            onPress: navigator.back,
            child: Icon(FIcons.arrowLeft),
          )
        ],
      ),
      child: ListView(
        children: [
          FTextField(
            label: Text('Enter your name'),
            initialText: controller.state.configuration.userName,
            onChange: (value) =>
                controller.add(UserNameChanged(userName: value)),
          ).pad(),
          FTile(
            prefix: Icon(
                controller.state.configuration.dark ? FIcons.moon : FIcons.sun),
            title: '${controller.state.configuration.dark ? "DARK" : "LIGHT"}'
                .text(),
            onPress: () => controller
                .add(DarkToggled(dark: controller.state.configuration.dark)),
          ).pad(),
          FTileGroup.builder(
            count: AvailableThemes.length,
            divider: FItemDivider.full,
            tileBuilder: (context, index) {
              final _theme = AvailableThemes.elementAt(index);
              return FTile(
                suffix: _theme == controller.state.configuration.theme
                    ? Icon(FIcons.checkCheck)
                    : null,
                title: _theme.dark.debugLabel!.split(' ').first.text(),
                onPress: () => controller.add(ThemeChanged(theme: _theme)),
              );
            },
          ).pad(),

          // ShadSelect(
          //   initialValue: 'slate',
          //   maxHeight: 200,
          //   options: shadThemeColors.map(
          //     (option) => ShadOption(
          //       value: option,
          //       child: Text(
          //         option.capitalizeFirst(),
          //       ),
          //     ),
          //   ),
          //   selectedOptionBuilder: (context, value) {
          //     return Text(value.capitalizeFirst());
          //   },
          //   onChanged: (value) {
          //     if (value != null) colorSchemeNameRM.state = value;
          //   },
          // ).pad(),
          // ShadSelect(
          //   initialValue: settingsBloc.themeMode(),
          //   maxHeight: 200,
          //   options: ThemeMode.values.map(
          //     (option) => ShadOption(
          //       value: option,
          //       child: Text(
          //         option.name.capitalizeFirst(),
          //       ),
          //     ),
          //   ),
          //   selectedOptionBuilder: (context, value) {
          //     return Text(value.name.capitalizeFirst());
          //   },
          //   onChanged: settingsBloc.themeMode,
          // ).pad(),
          // ShadSelect(
          //   initialValue: settingsBloc.viewMode(),
          //   maxHeight: 200,
          //   options: ViewMode.values.map(
          //     (option) => ShadOption(
          //       value: option,
          //       child: Text(
          //         option.name.capitalizeFirst(),
          //       ),
          //     ),
          //   ),
          //   selectedOptionBuilder: (context, value) {
          //     return Text(value.name.capitalizeFirst());
          //   },
          //   onChanged: settingsBloc.viewMode,
          // ).pad(),
          // ShadSwitch(
          //   // leading:
          //   // Icon(Icons.vertical_align_bottom, color: theme.primaryColor),
          //   // title: 'Add New Items to Bottom'.text(),
          //   value: settingsBloc.addToBottom(),
          //   onChanged: settingsBloc.addToBottom,
          //   // activeColor: theme.primaryColor,
          //   // trailing: Switch(),
          // ),
          // ShadSwitch(
          //   // leading: Icon(Icons.sort, color: theme.primaryColor),
          //   // title: 'Move Checked Items to Bottom'.text(),
          //   value: settingsBloc.moveCheckedToBottom(),
          //   onChanged: settingsBloc.moveCheckedToBottom,
          //   // activeColor: theme.primaryColor,
          // ),
          // ShadSwitch(
          //   // leading: Icon(Icons.link, color: theme.primaryColor),
          //   // title: 'Display Rich Link Previews'.text(),
          //   value: settingsBloc.showLinkPreviews(),
          //   onChanged: settingsBloc.showLinkPreviews,
          //   // activeColor: theme.primaryColor,
          //   // trailing: Switch(),
          // ),
          // ShadSwitch(
          //   // subtitle: Icon(Icons.share, color: theme.primaryColor),
          //   // title: 'Enable Sharing'.text(),
          //   value: settingsBloc.enableSharing(),
          //   onChanged: settingsBloc.enableSharing,
          //   // activeColor: theme.primaryColor,
          //   // trailing: Switch(),
          // ),
          // Column(
          //   children: [
          //     FTile(
          //       prefixIcon: Icon(Icons.restore, color: theme.colorScheme.error),
          //       title: 'Morning {reminderTimes().morning}'.text(),
          //       onPress: () async {
          //         final picked = await showTimePicker(
          //           context: context,
          //           initialTime: TimeOfDay.now(),
          //         );
          //         if (picked != null) {
          //           // reminderTimes(reminderTimes().copyWith(morning: picked));
          //         }
          //       },
          //     ),
          //     FTile(
          //       prefixIcon: Icon(Icons.restore, color: theme.colorScheme.error),
          //       title: 'Noon {reminderTimes().noon}'.text(),
          //       onPress: () async {
          //         final picked = await showTimePicker(
          //           context: context,
          //           initialTime: TimeOfDay.now(),
          //         );
          //         if (picked != null) {
          //           // reminderTimes(reminderTimes().copyWith(noon: picked));
          //         }
          //       },
          //     ),
          //     FTile(
          //       prefixIcon: Icon(Icons.restore, color: theme.colorScheme.error),
          //       title: 'Evening {reminderTimes().evening}'.text(),
          //       onPress: () async {
          //         // final picked = await showTimePicker(
          //         //   context: context,
          //         //   initialTime: TimeOfDay.now(),
          //         // );
          //         // if (picked != null) {
          //         //   reminderTimes(reminderTimes().copyWith(evening: picked));
          //         // }
          //       },
          //     ),
          //   ],
          // ),
          // ListTile(
          //   leading: Icon(Icons.restore, color: theme.colorScheme.error),
          //   title: 'Reset Settings'.text(),
          //   onTap: settingsBloc.settings() == Settings()
          //       ? null
          //       : () => settingsBloc.settings(Settings()),
          // ),
          FTile(
            prefix: Icon(FIcons.delete),
            title: 'Clear All Notes'.text(),
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => FDialog(
                  direction: Axis.horizontal,
                  title: 'Clear All Notes'.text(),
                  body: 'Are you sure you want to delete all notes?'.text(),
                  actions: [
                    FButton(
                      onPress: () async {
                        controller.add(DeleteAllNotes());
                        navigator.back();
                      },
                      style: FButtonStyle.destructive(),
                      child: 'Clear'.text(),
                    ),
                    FButton(
                      onPress: navigator.back,
                      child: 'Cancel'.text(),
                    ),
                  ],
                ),
              );
            },
          ).pad(),
        ],
      ),
    );
  }

  reminderTimes() {}
}

extension on String {
  // ignore: unused_element
  String capitalizeFirst() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
