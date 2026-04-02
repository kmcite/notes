import 'package:alien_signals/alien_signals.dart';
import 'package:flutter/material.dart';
import 'package:forui/theme.dart';

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

final availableThemesSignal = signal(AvailableThemes.first);
final darkSignal = signal(false);

void onThemeChanged(
  ({FPlatformThemeData dark, FPlatformThemeData light}) newTheme,
) {
  availableThemesSignal.set(newTheme);
}

void onDarkToggled() {
  darkSignal.set(!darkSignal());
}

final effectiveThemeComputed = computed((_) {
  return darkSignal()
      ? availableThemesSignal().dark
      : availableThemesSignal().light;
});

final themeModeComputed = computed((_) {
  return darkSignal() ? ThemeMode.dark : ThemeMode.light;
});

final userNameSignal = signal('');

void onUserNameChanged(String newUserName) {
  userNameSignal.set(newUserName);
}
