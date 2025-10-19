import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/domain/repositories/notes_repository.dart';
import 'package:notes/main.dart';
import 'package:notes/features/notes/types/images/image_tile.dart';

class ImagesBloc extends Cubit<Iterable<Note>> {
  late NotesRepository notesRepository = of();
  @override
  Future<Iterable<Note>> init() async => notesRepository.images;

  ImagesBloc() {
    notesRepository.stream.listen((_) => emit(notesRepository.images));
  }
}

class ImagesView extends Feature<ImagesBloc> {
  const ImagesView({super.key});

  @override
  ImagesBloc create() => ImagesBloc();

  @override
  Widget build(BuildContext context, controller) {
    if (controller.state.isEmpty) {
      return Icon(
        FIcons.image,
        size: 96,
      );
    }
    return ListView.builder(
      itemCount: controller.state.length,
      itemBuilder: (context, index) {
        final note = controller.state.elementAt(index);
        return ImageNoteTile(note: note).pad();
      },
    );
  }
}
