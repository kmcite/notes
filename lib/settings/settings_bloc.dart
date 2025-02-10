import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:notes/main.dart';

part 'settings_bloc.freezed.dart';
part 'settings_bloc.g.dart';

final settingsBloc = SettingsBloc();

class SettingsBloc {
  final settingsRM = RM.inject(
    () => Settings(),
    persist: () => PersistState(
      key: 'settings',
      fromJson: (json) => Settings.fromJson(jsonDecode(json)),
      toJson: (s) => jsonEncode(s.toJson()),
    ),
  );

  String get _imagePath => settings().imagePath;
  set _imagePath(String value) {
    settings(settings().copyWith(imagePath: value));
  }

  File get _defaultImageFile {
    return File("D:\\quiz.png");
  }

  File get imageFile {
    if (_imagePath == '') {
      return _defaultImageFile;
    }
    return File(_imagePath);
  }

  void pickImage() async {
    final filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      final path = filePickerResult.files.first.path;
      if (path != null) {
        _imagePath = path;
      }
    }
  }

  Settings settings([Settings? _]) {
    if (_ != null) settingsRM.state = _;
    return settingsRM.state;
  }

  ThemeMode themeMode([ThemeMode? themeMode]) {
    if (themeMode != null) settings(settings().copyWith(themeMode: themeMode));
    return settings().themeMode;
  }

  ViewMode viewMode([ViewMode? viewMode]) {
    if (viewMode != null) settings(settings().copyWith(viewMode: viewMode));
    return settings().viewMode;
  }

  bool addToBottom([bool? i]) {
    if (i != null) settings(settings().copyWith(addToBottom: i));
    return settings().addToBottom;
  }

  bool enableSharing([bool? i]) {
    if (i != null) settings(settings().copyWith(enableSharing: i));
    return settings().enableSharing;
  }

  bool moveCheckedToBottom([bool? i]) {
    if (i != null) settings(settings().copyWith(moveCheckedToBottom: i));
    return settings().moveCheckedToBottom;
  }

  bool showLinkPreviews([bool? i]) {
    if (i != null) settings(settings().copyWith(showLinkPreviews: i));
    return settings().showLinkPreviews;
  }

  String userName([String? i]) {
    if (i != null) settings(settings().copyWith(userName: i));
    return settings().userName;
  }
}

enum ViewMode { list, grid }

@freezed
class Settings with _$Settings {
  const factory Settings({
    @Default(false) bool addToBottom,
    @Default(false) bool enableSharing,
    @Default(false) bool moveCheckedToBottom,
    @Default(false) bool showLinkPreviews,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(ViewMode.list) ViewMode viewMode,
    @Default('Adn') String userName,
    @Default('Adn') String imagePath,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

final colorSchemeNameRM = RM.inject(() => shadThemeColors.first);
String get colorSchemeName => colorSchemeNameRM.state;
final shadThemeColors = [
  'blue',
  'gray',
  'green',
  'neutral',
  'orange',
  'red',
  'rose',
  'slate',
  'stone',
  'violet',
  'yellow',
  'zinc',
];
