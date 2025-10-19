import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/domain/models/note.dart';
import 'package:notes/features/notes/types/archives.dart';
import 'package:notes/features/notes/types/images/images.dart';
import 'package:notes/features/notes/types/news_page.dart';
import 'package:notes/features/notes/types/normals/normals.dart';
import 'package:notes/features/notes/types/trash_page.dart';

extension NoteTypeX on NoteType {
  String get label => switch (this) {
        NoteType.normal => 'Normals',
        NoteType.archives => 'Archives',
        NoteType.trash => 'Deleted',
        NoteType.images => 'Images',
        NoteType.news => 'News',
      };
  IconData get icon => switch (this) {
        NoteType.normal => FIcons.notebook,
        NoteType.archives => FIcons.archive,
        NoteType.trash => FIcons.delete,
        NoteType.images => FIcons.image,
        NoteType.news => FIcons.newspaper,
      };
  Widget get page => switch (this) {
        NoteType.normal => NormalsView(),
        NoteType.archives => ArchivesView(),
        NoteType.trash => TrashPage(),
        NoteType.images => ImagesView(),
        NoteType.news => NewsPage(),
      };
}

///
/// notes
/// archives
/// deleted-ones
/// image-based
