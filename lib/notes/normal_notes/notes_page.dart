import 'package:notes/main.dart';

class NotesPage extends UI {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => RM.scaffold.openDrawer(),
        // ),
        title: Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(
              settingsBloc.viewMode() == ViewMode.grid
                  ? Icons.list
                  : Icons.grid_view,
            ),
            onPressed: () => settingsBloc.viewMode(
              settingsBloc.viewMode() == ViewMode.grid
                  ? ViewMode.list
                  : ViewMode.grid,
            ),
          ).pad(right: 8),
          FloatingActionButton.small(
            child: Icon(Icons.add),
            onPressed: () {
              final noteToAdd = Note();
              notesRM.note(noteToAdd);
            },
          ).pad(right: 8),
        ],
      ),
      body: switch (settingsBloc.viewMode()) {
        ViewMode.grid => GridView.builder(
            itemCount: notesRM.notes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final note = notesRM.notes.elementAt(index);
              return GestureDetector(
                onTap: () => navigateToNotePage(note.id),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (note.title.isNotEmpty)
                        Wrap(
                          children: [
                            Text(
                              note.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).pad(),
                          ],
                        ),
                      Expanded(
                        child: Text(
                          note.details,
                          maxLines: null,
                          overflow: TextOverflow.fade,
                        ).pad(),
                      ),
                    ],
                  ),
                ),
              ).pad();
            },
          ),
        ViewMode.list => ListView.builder(
            itemCount: notesRM.notes.length,
            itemBuilder: (context, index) {
              final note = notesRM.notes.elementAt(index);
              return GestureDetector(
                onTap: () => navigateToNotePage(note.id),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (note.title.isNotEmpty)
                        Wrap(
                          children: [
                            Text(
                              note.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).pad(),
                          ],
                        ),
                      Expanded(
                        child: Text(
                          note.details,
                          maxLines: null,
                          overflow: TextOverflow.fade,
                        ).pad(),
                      ),
                      IconButton(
                        onPressed: () {
                          notesRM.archive(note);
                        },
                        icon: Icon(Icons.archive),
                      )
                    ],
                  ),
                ),
              ).pad();
            },
          ),
      },
    );
  }
}
