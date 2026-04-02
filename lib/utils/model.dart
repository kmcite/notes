import 'package:alien_signals/alien_signals.dart';
import 'package:flutter/material.dart';

/// is an abstract for data models that should be identified
/// or provide toJson

abstract class Model {
  int get id;
}

abstract class ToJson {
  Map<String, dynamic> toJson();
}

abstract class UI extends StatefulWidget {
  const UI({super.key});
  @override
  State<StatefulWidget> createState() => _UI();
  Widget build(BuildContext context);
}

class _UI extends State<UI> {
  late final _build = computed((_) => widget.build(context));
  initState() {
    super.initState();
    print(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(context);
  }

  @override
  Widget build(BuildContext context) => _build();
}
