import 'package:notes/main.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NotesPage extends UI {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          ShadButton(
            icon: Icon(
              settingsBloc.viewMode() == ViewMode.grid
                  ? Icons.list
                  : Icons.grid_view,
            ),
            onPressed: () {
              settingsBloc.viewMode(
                settingsBloc.viewMode() == ViewMode.grid
                    ? ViewMode.list
                    : ViewMode.grid,
              );
            },
          ).pad(right: 8),
        ],
      ),
      body: notesRM.loading
          ? CircularProgressIndicator().center()
          : switch (settingsBloc.viewMode()) {
              ViewMode.grid => GridView.builder(
                  itemCount: notesRM.notes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final note = notesRM.notes.elementAt(index);
                    return GestureDetector(
                      onTap: () => navigationBloc.navigateToNotePage(note.id),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (note.title.isNotEmpty)
                              Text(
                                note.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                note.details,
                                maxLines: null,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).pad(),
              ViewMode.list => ListView.builder(
                  itemCount: notesRM.notes.length,
                  itemBuilder: (context, index) {
                    final note = notesRM.notes.elementAt(index);
                    return GestureDetector(
                      onTap: () => navigationBloc.navigateToNotePage(note.id),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (note.title.isNotEmpty)
                              Text(
                                note.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            const SizedBox(height: 8),
                            Text(
                              note.details,
                              maxLines: null,
                              overflow: TextOverflow.fade,
                            ),
                            IconButton(
                              onPressed: () {
                                notesRM.archive(note.id);
                                print(note.id);
                              },
                              icon: const Icon(Icons.archive),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            },
      floatingActionButton: ShadButton(
        child: Icon(Icons.add),
        onPressed: () {
          final noteToAdd = Note();
          notesRM.note(noteToAdd);
        },
      ),
    );
  }
}
