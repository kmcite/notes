import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
export 'package:manager/manager.dart';
import 'package:notes/domain/api/configuration_repository.dart';
import 'package:notes/ui/notes/home.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(),
  );
}

class App extends UI {
  @override
  Widget build(context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: fThemeData(),
        child: child!,
      ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: darkMode() ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}
