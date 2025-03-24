import 'package:forui/theme.dart';
import 'package:notes/ui/notes/notes_page.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

final themes = [
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

final darkRepository = RM.inject<bool>(() => true);
final themeRepository = RM.inject(() => themes.first);
final viewModeRepository = RM.inject(() => ViewMode.list);
final nameRepository = RM.inject(() => '');
