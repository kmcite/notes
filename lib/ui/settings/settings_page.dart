import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/domain/api/notes_repository.dart';
import 'package:notes/main.dart';
import 'package:notes/utils/navigator.dart';
import 'package:notes/utils/api.dart';

mixin SettingsBloc {
  late final deleteAll = notesRepository.deleteAll;
  THEMES _themes([THEMES? val]) {
    if (val != null) {
      themeRepository.state = val;
    }
    return themeRepository.state;
  }

  bool get dark => darkRepository.state;
  void toggleDark() => darkRepository.state = !dark;

  String get name => nameRepository.state;
  void setName(String value) => nameRepository.state = value;
}

class SettingsPage extends UI with SettingsBloc {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: 'SETTINGS'.text(),
        prefixActions: [
          FButton.icon(
            onPress: navigator.back,
            child: FIcon(FAssets.icons.arrowLeft),
          )
        ],
      ),
      content: ListView(
        children: [
          FTextField(
            label: Text('Enter your name'),
            initialValue: name,
            onChange: setName,
          ).pad(),
          FTile(
            prefixIcon: FIcon(dark ? FAssets.icons.moon : FAssets.icons.sun),
            title: '${dark ? "DARK" : "LIGHT"}'.text(),
            onPress: toggleDark,
          ).pad(),
          FTileGroup.builder(
            count: themes.length,
            divider: FTileDivider.full,
            tileBuilder: (context, index) {
              final _theme = themes.elementAt(index);
              return FTile(
                suffixIcon: _theme == _themes()
                    ? FIcon(FAssets.icons.checkCheck)
                    : null,
                title: _theme.dark.debugLabel!.split(' ').first.text(),
                onPress: () => _themes(_theme),
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
            prefixIcon: FIcon(FAssets.icons.delete),
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
                        await deleteAll();
                        navigator.back();
                      },
                      style: FButtonStyle.destructive,
                      label: 'Clear'.text(),
                    ),
                    FButton(
                      onPress: navigator.back,
                      label: 'Cancel'.text(),
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
