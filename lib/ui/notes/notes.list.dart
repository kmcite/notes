part of 'notes.dart';

class NotesList extends UI {
  @override
  Widget build(BuildContext context) {
    return normalNotes().isEmpty
        ? Icon(
            FIcons.notebook,
            size: 96,
          )
        : Column(
            children: List.generate(
              normalNotes().length,
              (i) {
                final note = normalNotes().elementAt(i);
                return FTile(
                  title: note.title.text(),
                  subtitle: note.details.text(),
                  onPress: () => gotoNote(note),
                );
              },
            ),
          );
  }
}
