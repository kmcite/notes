import 'package:flutter/material.dart';
import 'package:notes/domain/repositories/configuration_repository.dart';
import 'package:notes/features/app.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/main.dart';
import 'package:notes/objectbox.g.dart';
export 'package:spark/spark.dart';
export 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends Injector {
  @override
  Widget build(BuildContext context) {
    return ApplicationView();
  }

  Future<void> init() async {
    final store = await openStore();
    putService(store);
    final preferences = await SharedPreferences.getInstance();
    putService(preferences);
    putRepository(NotesRepository());
    putRepository(ConfigurationRepository());
  }
}
