import 'package:notes/main.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

final settingsBloc = SettingsBloc();

class SettingsBloc {
  final settingsRM = rms(
    Settings(),
    persisted: () => persisted(
      'settings',
      Settings.fromJson,
    ),
  );
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
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
