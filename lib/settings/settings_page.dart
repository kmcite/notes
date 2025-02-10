import 'package:notes/main.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
          ShadInput(
            placeholder: Text('Enter your name'),
            initialValue: settingsBloc.userName(),
            onChanged: settingsBloc.userName,
          ).pad(),
          ShadSelect(
            initialValue: 'slate',
            maxHeight: 200,
            options: shadThemeColors.map(
              (option) => ShadOption(
                value: option,
                child: Text(
                  option.capitalizeFirst(),
                ),
              ),
            ),
            selectedOptionBuilder: (context, value) {
              return Text(value.capitalizeFirst());
            },
            onChanged: (value) {
              if (value != null) colorSchemeNameRM.state = value;
            },
          ).pad(),
          ShadSelect(
            initialValue: settingsBloc.themeMode(),
            maxHeight: 200,
            options: ThemeMode.values.map(
              (option) => ShadOption(
                value: option,
                child: Text(
                  option.name.capitalizeFirst(),
                ),
              ),
            ),
            selectedOptionBuilder: (context, value) {
              return Text(value.name.capitalizeFirst());
            },
            onChanged: settingsBloc.themeMode,
          ).pad(),
          ShadSelect(
            initialValue: settingsBloc.viewMode(),
            maxHeight: 200,
            options: ViewMode.values.map(
              (option) => ShadOption(
                value: option,
                child: Text(
                  option.name.capitalizeFirst(),
                ),
              ),
            ),
            selectedOptionBuilder: (context, value) {
              return Text(value.name.capitalizeFirst());
            },
            onChanged: settingsBloc.viewMode,
          ).pad(),
          ShadSwitch(
            // leading:
            // Icon(Icons.vertical_align_bottom, color: theme.primaryColor),
            // title: 'Add New Items to Bottom'.text(),
            value: settingsBloc.addToBottom(),
            onChanged: settingsBloc.addToBottom,
            // activeColor: theme.primaryColor,
            // trailing: Switch(),
          ),
          ShadSwitch(
            // leading: Icon(Icons.sort, color: theme.primaryColor),
            // title: 'Move Checked Items to Bottom'.text(),
            value: settingsBloc.moveCheckedToBottom(),
            onChanged: settingsBloc.moveCheckedToBottom,
            // activeColor: theme.primaryColor,
          ),
          ShadSwitch(
            // leading: Icon(Icons.link, color: theme.primaryColor),
            // title: 'Display Rich Link Previews'.text(),
            value: settingsBloc.showLinkPreviews(),
            onChanged: settingsBloc.showLinkPreviews,
            // activeColor: theme.primaryColor,
            // trailing: Switch(),
          ),
          ShadSwitch(
            // subtitle: Icon(Icons.share, color: theme.primaryColor),
            // title: 'Enable Sharing'.text(),
            value: settingsBloc.enableSharing(),
            onChanged: settingsBloc.enableSharing,
            // activeColor: theme.primaryColor,
            // trailing: Switch(),
          ),
          Column(
            children: [
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
                    TextButton(
                      onPressed: context.pop,
                      child: 'Cancel'.text(),
                    ),
                    TextButton(
                      onPressed: () {
                        notesRM.removeAll();
                        context.pop();
                      },
                      child: 'Clear'.text(),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                    ),
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

extension on String {
  String capitalizeFirst() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
