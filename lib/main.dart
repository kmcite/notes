// export 'package:manager/manager.dart';
// export 'package:notes/_/navigation/navigation_bloc.dart';
// export 'package:notes/settings/settings_bloc.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/domain/api/dark.dart';
// import 'package:notes/navigator.dart';
// import 'package:notes/notes/home_page.dart';
// import 'package:notes/domain/api/notes_repository.dart';
// import 'package:uuid/uuid.dart';

// import 'main.dart';
// export 'objectbox.g.dart';
// export 'package:notes/notes/notes_bloc.dart';
// export 'package:notes/_/navigation/navigation_repository.dart';
// export 'package:notes/_/navigation/app_drawer.dart';
// export 'package:notes/_/navigation/app_scaffold.dart';
// export 'package:notes/notes/note/note.dart';
// export 'package:go_router/go_router.dart' hide RouteData;
// export 'dart:async';
// export 'dart:convert';
// export 'package:flex_color_scheme/flex_color_scheme.dart';
// export 'package:notes/notes/note/note_bloc.dart';
// export 'package:notes/notes/archives/archives_page.dart';
// export 'package:notes/settings/feedback.dart';
// export 'package:notes/notes/note/note_page.dart';
// export 'package:notes/notes/notes_page.dart';
// export 'package:notes/notes/image_notes/image_notes_page.dart';
// export 'package:notes/settings/settings_page.dart';
// export 'package:notes/notes/trash/trashed_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await RM.storageInitializer(HiveStorage());
//   // store = await openStore();
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => NavigationBloc()),
//         // BlocProvider(create: (context) => HomeBloc()),
//         // BlocProvider(create: (context) => NotesBloc()),
//         // BlocProvider(create: (context) => NoteBloc()),
//         BlocProvider(create: (context) => ArchivesBloc()),
//         BlocProvider(create: (context) => TrashedBloc()),
//         BlocProvider(create: (context) => ImageNotesBloc()),
//       ],
//       child: NotesApp(),
//     ),
//   );
// }

// mixin AppBloc {
//   bool get dark => darkRepository.state;
// }

// class NotesApp extends UI with AppBloc {
//   build(_) {
//     return MaterialApp(
//       navigatorKey: navigator.navigatorKey,
//       debugShowCheckedModeBanner: false,
//       builder:
//           (context, child) => FTheme(
//             data: dark ? FThemes.yellow.dark : FThemes.green.light,
//             child: child!,
//           ),
//       home: HomePage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/utils/navigator.dart';
import 'package:notes/ui/notes/home.dart';
import 'package:notes/utils/api.dart';
import 'package:notes/utils/floor.dart';
import 'package:states_rebuilder/scr/state_management/state_management.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await $FloorAppDatabase.databaseBuilder('notes_3.db').build();
  runApp(App());
}

typedef THEMES = ({FThemeData dark, FThemeData light});

mixin AppBloc {
  bool get dark => darkRepository.state;
  FThemeData get themeData =>
      dark ? themeRepository.state.dark : themeRepository.state.light;
}

class App extends UI with AppBloc {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: themeData,
        child: child!,
      ),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}

typedef UI = ReactiveStatelessWidget;
