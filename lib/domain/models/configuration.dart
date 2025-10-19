import 'package:forui/theme.dart';
import 'package:notes/domain/models/available_themes.dart';
import 'package:notes/domain/models/view_mode.dart';
import 'package:notes/utils/model.dart';

class Configuration extends ToJson {
  bool dark = false;
  String userName = 'Adn';
  ViewMode mode = ViewMode.list;
  ({FThemeData dark, FThemeData light}) theme = AvailableThemes.first;

  @override
  Map<String, dynamic> toJson() => {
        'dark': dark,
        'userName': userName,
        'mode': mode.index,
        'theme': AvailableThemes.indexOf(theme),
      };
  Configuration.fromJson(Map<String, dynamic> json) {
    dark = json['dark'] ?? false;
    userName = json['userName'] ?? 'Adn';
    mode = ViewMode.values.elementAt(json['mode'] ?? 0);
    theme = AvailableThemes.elementAt(json['theme'] ?? 0);
  }
  Configuration();
}
