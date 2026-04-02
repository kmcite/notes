// import 'dart:convert';

// import 'package:notes/domain/models/configuration.dart';
// import 'package:notes/domain/models/view_mode.dart';
// import 'package:notes/features/settings/settings.dart';
// import 'package:notes/main.dart';

// abstract class LocalRepository<T> extends Repository<T> {
//   late final prefs = of<SharedPreferences>();

//   LocalRepository() {
//     final stored = prefs.getString(key);
//     if (stored != null) {
//       final decode = jsonDecode(stored);
//       if (decode != null) {
//         final type = fromJson(decode);
//         emit(type);
//       }
//     }
//   }
//   @override
//   void emit(state) {
//     super.emit(state);
//     prefs.setString(key, jsonEncode((state as dynamic).toJson()));
//   }

//   String get key;
//   T fromJson(json);
// }

// class ConfigurationRepository extends LocalRepository<Configuration> {
//   @override
//   Configuration get initialState => Configuration();
//   @override
//   Configuration fromJson(json) => Configuration.fromJson(json);

//   @override
//   String get key => 'config';

//   void setMode(ViewMode mode) => emit(state..mode = mode);
//   void setDark(bool dark) => emit(state..dark = dark);
//   void setUserName(String name) => emit(state..userName = name);
//   void setTheme(Themes theme) => emit(state..theme = theme);
// }
