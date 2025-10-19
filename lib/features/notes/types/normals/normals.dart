import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes/domain/models/configuration.dart';
import 'package:notes/domain/repositories/configuration_repository.dart';
import 'package:notes/domain/models/view_mode.dart';
import 'package:notes/features/notes/types/normals/notes_list.dart';
import 'package:notes/features/notes/types/normals/notes_grid.dart';
import 'package:spark/spark.dart';

class NormalsBloc extends Cubit<ViewMode> {
  late ConfigurationRepository configurationRepository = of();
  StreamSubscription<Configuration>? subscription;

  Future<ViewMode> init() async {
    subscription = configurationRepository.stream.listen(
      (configuration) {
        emit(configuration.mode);
      },
    );
    return ViewMode.list;
  }

  @override
  Future<void> dispose() async {
    await subscription?.cancel();
    subscription = null;
    await super.dispose();
  }
}

class NormalsView extends Feature<NormalsBloc> {
  const NormalsView({super.key});

  @override
  NormalsBloc create() => NormalsBloc();

  @override
  Widget build(BuildContext context, controller) {
    return switch (controller.state) {
      ViewMode.list => NotesListView(),
      ViewMode.grid => NotesGridView(),
    };
  }
}
