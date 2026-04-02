import 'package:flutter/material.dart';
import 'package:notes/features/app.dart';
import 'package:notes/utils/model.dart';
export 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends UI {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationView();
  }

  // Future<void> init() async {
  //   final store = await openStore();
  //   putService(store);
  //   final preferences = await SharedPreferences.getInstance();
  //   putService(preferences);
  //   putRepository(NotesRepository());
  //   putRepository(ConfigurationRepository());
  // }
}
