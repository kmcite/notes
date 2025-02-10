import 'package:notes/main.dart';

class ArchivesPage extends UI {
  const ArchivesPage({super.key});

  @override
  Widget build(context) {
    return AppScaffold(
      appBar: AppBar(
        title: "Archives".text(),
      ),
      body: archivesRM.archives.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.archive,
                  size: 120,
                  color: Colors.amber,
                ).center(),
                'Archives are empty for now'.text(),
              ],
            )
          : ListView.builder(
              itemCount: archivesRM.archives.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(archivesRM.archives[index].title),
                  trailing: IconButton(
                    icon: Icon(Icons.unarchive),
                    onPressed: () {
                      final note = archivesRM.archives[index];
                      archivesRM.unArchive(note);
                    },
                  ),
                );
              },
            ),
    );
  }
}
