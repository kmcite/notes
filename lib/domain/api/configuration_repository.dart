import 'package:forui/theme.dart';
import 'package:notes/ui/notes/notes.dart';
import 'package:signals_flutter/signals_flutter.dart';

final AvailableThemes = [
  FThemes.blue,
  FThemes.green,
  FThemes.orange,
  FThemes.red,
  FThemes.rose,
  FThemes.slate,
  FThemes.violet,
  FThemes.yellow,
  FThemes.zinc,
];

final currentTheme = signal(AvailableThemes.first);
final fThemeData = computed(
  () => darkMode() ? currentTheme().dark : currentTheme().light,
);
final darkMode = signal(true);
final viewMode = signal(ViewMode.list);
final userName = signal('');
