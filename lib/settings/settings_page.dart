import 'package:notes/main.dart';

class SettingsPage extends UI {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: AppBar(
        title: 'SETTINGS'.text(),
      ),
      body: ListView(
        children: [
          TextFormField(
            initialValue: settingsBloc.userName(),
            onChanged: settingsBloc.userName,
          ).pad(),
          SegmentedButton(
            segments: [ThemeMode.light, ThemeMode.dark]
                .map(
                  (themeMode) => ButtonSegment(
                    label: themeMode.name.toUpperCase().text(),
                    value: themeMode,
                  ),
                )
                .toList(),
            selected: {
              settingsBloc.themeMode(),
            },
            onSelectionChanged: (value) {
              settingsBloc.themeMode(value.first);
            },
          ).pad(),
          SegmentedButton(
            segments: ViewMode.values
                .map(
                  (themeMode) => ButtonSegment(
                    label: themeMode.name.toUpperCase().text(),
                    value: themeMode,
                  ),
                )
                .toList(),
            selected: {
              settingsBloc.viewMode(),
            },
            onSelectionChanged: (value) {
              settingsBloc.viewMode(value.first);
            },
          ).pad(),
          SwitchListTile(
            // leading:
            // Icon(Icons.vertical_align_bottom, color: theme.primaryColor),
            title: 'Add New Items to Bottom'.text(),
            value: settingsBloc.addToBottom(),
            onChanged: settingsBloc.addToBottom,
            activeColor: theme.primaryColor,
            // trailing: Switch(),
          ),
          SwitchListTile(
            // leading: Icon(Icons.sort, color: theme.primaryColor),
            title: 'Move Checked Items to Bottom'.text(),
            value: settingsBloc.moveCheckedToBottom(),
            onChanged: settingsBloc.moveCheckedToBottom,
            activeColor: theme.primaryColor,
          ),
          SwitchListTile(
            // leading: Icon(Icons.link, color: theme.primaryColor),
            title: 'Display Rich Link Previews'.text(),
            value: settingsBloc.showLinkPreviews(),
            onChanged: settingsBloc.showLinkPreviews,
            activeColor: theme.primaryColor,
            // trailing: Switch(),
          ),
          Column(
            children: [
              SwitchListTile(
                // subtitle: Icon(Icons.share, color: theme.primaryColor),
                title: 'Enable Sharing'.text(),
                value: settingsBloc.enableSharing(),
                onChanged: settingsBloc.enableSharing,
                activeColor: theme.primaryColor,
                // trailing: Switch(),
              ),
              ListTile(
                leading: Icon(Icons.restore, color: theme.colorScheme.error),
                // title: 'Morning ${reminderTimes().morning}'.text(),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    // reminderTimes(reminderTimes().copyWith(morning: picked));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.restore, color: theme.colorScheme.error),
                // title: 'Noon ${reminderTimes().noon}'.text(),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    // reminderTimes(reminderTimes().copyWith(noon: picked));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.restore, color: theme.colorScheme.error),
                // title: 'Evening ${reminderTimes().evening}'.text(),
                onTap: () async {
                  // final picked = await showTimePicker(
                  //   context: context,
                  //   initialTime: TimeOfDay.now(),
                  // );
                  // if (picked != null) {
                  //   reminderTimes(reminderTimes().copyWith(evening: picked));
                  // }
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.restore, color: theme.colorScheme.error),
            title: 'Reset Settings'.text(),
            onTap: settingsBloc.settings() == Settings()
                ? null
                : () => settingsBloc.settings(Settings()),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: theme.colorScheme.error),
            title: 'Clear All Notes'.text(),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: 'Clear All Notes'.text(),
                  content: 'Are you sure you want to delete all notes?'.text(),
                  actions: [
                    // TextButton(
                    //   onPressed: navigator.back,
                    //   child: 'Cancel'.text(),
                    // ),
                    // TextButton(
                    //   onPressed: () {
                    //     removeAllNotes();
                    //     navigator.back();
                    //   },
                    //   child: 'Clear'.text(),
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: theme.colorScheme.error,
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
