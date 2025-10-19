import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:notes/domain/models/configuration.dart';
import 'package:notes/domain/repositories/configuration_repository.dart';
import 'package:notes/features/notes/home.dart';
import 'package:notes/main.dart';

class ApplicationBloc extends Cubit<Configuration> {
  late final ConfigurationRepository configuration = of();
  @override
  Future<Configuration> init() async {
    subscription = configuration.stream.listen(
      (configuration) async {
        await Future.delayed(Duration(seconds: 1));
        emit(configuration);
      },
    );
    return configuration();
  }

  StreamSubscription<Configuration>? subscription;

  @override
  Future<void> dispose() {
    subscription?.cancel();
    subscription = null;
    return super.dispose();
  }
}

class ApplicationView extends Feature<ApplicationBloc> {
  @override
  ApplicationBloc create() => ApplicationBloc();
  @override
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildError(error) {
    return Center(
      child: Text(error.toString()),
    );
  }

  @override
  Widget build(context, controller) {
    return MaterialApp(
      navigatorKey: navigator.key,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FTheme(
          data: controller.value.dark
              ? controller.value.theme.dark
              : controller.value.theme.light,
          child: child!,
        );
      },
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: controller.value.dark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}
