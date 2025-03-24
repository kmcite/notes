import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:notes/main.dart';
import 'package:notes/ui/notes/notes_page.dart';
import 'package:notes/utils/api.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

mixin class HomeBloc {
  final indexRM = 0.inj();
  int index([int? value]) {
    if (value != null) indexRM.state = value;
    return indexRM.state;
  }
}

class HomePage extends UI with HomeBloc {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      content: NotesPage(), // 'Pages.values[index()].page'.text(),
      footer: FBottomNavigationBar(
        index: index(),
        onChange: index,
        children: Pages.values.map(
          (page) {
            return FBottomNavigationBarItem(
              label: page.label.text(),
              icon: FIcon(page.icon),
            );
          },
        ).toList(),
      ),
    );
  }
}

enum Pages { notes, archives, deleted, image }

extension on Pages {
  String get label => switch (this) {
        Pages.notes => 'Notes',
        Pages.archives => 'Archives',
        Pages.deleted => 'Deleted',
        Pages.image => 'Images',
      };
  SvgAsset get icon => switch (this) {
        Pages.notes => FAssets.icons.notebook,
        Pages.archives => FAssets.icons.archive,
        Pages.deleted => FAssets.icons.delete,
        Pages.image => FAssets.icons.image,
      };

  // Widget get page => switch (this) {
  //   Pages.notes => NotesPage(),
  //   Pages.archives => ArchivesPage(),
  //   Pages.deleted => TrashPage(),
  //   Pages.image => ImageNotesPage(),
  // };
}

///
/// notes
/// archives
/// deleted-ones
/// image-based
