import 'package:notes/domain/models/note.dart';
import 'package:signals_flutter/signals_flutter.dart';

final notes = mapSignal<int, Note>({});
final note = signal(Note());
