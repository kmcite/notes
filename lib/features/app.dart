import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:notes/domain/models/available_themes.dart';
import 'package:notes/domain/repositories/navigator.dart';
import 'package:notes/features/notes/home.dart';

class ApplicationView extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      navigatorKey: navigator,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FTheme(
          data: effectiveThemeComputed().touch,
          child: child!,
        );
      },
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: themeModeComputed(),
      home: HomePage(),
    );
  }
}
