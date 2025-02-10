import 'package:notes/main.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NotePage extends UI {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = navigationBloc.extra;

    final note = noteBloc.note(id);
    return AppScaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              notesRM.delete(note);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ).pad(right: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadInput(
              placeholder: Text('Title'),
              key: ValueKey('title'),
              initialValue: note.title,
              onChanged: (title) => noteBloc.put(note..title = title),
              maxLines: null,
            ),
            Expanded(
              child: ShadInput(
                placeholder: Text('Details'),
                key: ValueKey('details'),
                initialValue: note.details,
                onChanged: (details) => noteBloc.put(note..details = details),
                maxLines: null,
                minLines: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status: ${note.status}'),
                ShadButton(
                  onPressed: () => noteBloc.toggleStatus(id),
                  icon: Icon(
                    note.noteStatus == NoteStatus.Complete
                        ? Icons.done
                        : Icons.close,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ...NoteType.values.map(
                  (type) {
                    return Expanded(
                      child: ShadButton(
                        key: ValueKey(type),
                        enabled: note.noteType != type,
                        onPressed: () {
                          noteBloc.put(note..noteType = type);
                        },
                        height: 80,
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(type.icon, size: 36),
                            Icon(
                              type == note.noteType
                                  ? Icons.check_circle
                                  : Icons.circle,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Text('Created on: ${note.timeCreated}'),
            Text('Due date: ${note.dueDate}'),
          ],
        ),
      ),
      bottomNavigationBar: NoteEditToolbar(),
    );
  }
}

extension on NoteType {
  IconData get icon => switch (this) {
        NoteType.NormalNote => Icons.note,
        NoteType.NormalReminder => Icons.notifications_none,
        NoteType.Archived => Icons.archive,
        NoteType.Deleted => Icons.delete,
        NoteType.New => Icons.new_label,
      };
}

class NoteEditToolbar extends UI {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetMenu(
                    actions: [
                      ListTile(
                        leading: Icon(Icons.photo_camera),
                        title: Text('Take a photo'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text('Add an image'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.draw),
                        title: Text('Drawing'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.mic),
                        title: Text('Recording'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.check_box),
                        title: Text('Checkboxes'),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.add_box, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheetMenu(
                      actions: [
                        "Colors".text(textScaleFactor: 2).pad(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Colors.primaries.map(
                              (color) {
                                return Container(
                                  margin: EdgeInsets.all(8),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        "Backgrounds".text(textScaleFactor: 2).pad(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Colors.primaries.map(
                              (color) {
                                return Container(
                                  margin: EdgeInsets.all(8),
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.color_lens, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.text_format, color: Colors.white),
            ),
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
                .text(),
            Spacer(),
            IconButton(
              onPressed: () {
                // RM.navigate.toBottomSheet(BottomSheetMenu());
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetMenu(
                    actions: [
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete Note'),
                        onTap: () {
                          // notesRM.delete(context.of<NoteBloc>().state!);
                          Navigator.pop(context);
                          noteBloc.delete();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.copy),
                        title: Text('Make a copy'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Send'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.person_add),
                        title: Text('Collaborator'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.label),
                        title: Text('Labels'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help & Feedback'),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetMenu extends UI {
  final List<Widget> actions;
  BottomSheetMenu({super.key, this.actions = const []});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: actions,
    );
  }
}
