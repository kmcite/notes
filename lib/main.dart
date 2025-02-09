export 'package:manager/manager.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/navigation/navigation_bloc.dart';
export 'package:notes/settings/settings_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'main.dart';
export 'objectbox.g.dart';
export 'package:notes/notes/archives/archives_bloc.dart';
export 'package:notes/notes/notes_bloc.dart';
export 'package:notes/navigation/navigation_repository.dart';
export 'package:notes/navigation/app_drawer.dart';
export 'package:notes/navigation/app_scaffold.dart';
export 'package:notes/notes/note/note.dart';
export 'package:notes/notes/notes_repository.dart';
export 'package:go_router/go_router.dart' hide RouteData;
export 'dart:async';
export 'dart:convert';
export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:notes/notes/note/note_bloc.dart';
export 'package:notes/notes/archives/archives_page.dart';
export 'package:notes/settings/feedback.dart';
export 'package:notes/notes/note/note_page.dart';
export 'package:notes/notes/normal_notes/notes_page.dart';
export 'package:notes/notes/reminders/reminders_page.dart';
export 'package:notes/settings/settings_page.dart';
export 'package:notes/notes/trash/trashed_page.dart';
export 'package:notes/notes/reminders/reminders_bloc.dart';
export 'package:notes/notes/trash/trashed_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RM.storageInitializer(HiveStorage());
  store = await openStore();
  runApp(NotesApp());
}

class NotesApp extends UI {
  build(context) {
    return ShadApp.materialRouter(
      routerConfig: navigationBloc.router,
      debugShowCheckedModeBanner: false,
      theme: ShadThemeData(
        colorScheme: lightColorScheme,
        brightness: Brightness.light,
      ),
      darkTheme: ShadThemeData(
        colorScheme: darkColorScheme,
        brightness: Brightness.dark,
      ),
      themeMode: settingsBloc.themeMode(),
    );
  }
}

typedef UI = ReactiveStatelessWidget;

String get randomId => Uuid().v8();

final lightColorScheme = ShadColorScheme.fromName(
  colorSchemeName,
  brightness: Brightness.light,
);
final darkColorScheme = ShadColorScheme.fromName(
  colorSchemeName,
  brightness: Brightness.dark,
);
