import 'package:notes/main.dart';

class TrashPage extends UI {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: 'Trash'.text(),
        actions: [
          IconButton.filledTonal(
            tooltip: 'DELETE ALL',
            color: Colors.red,
            icon: Icon(Icons.delete_forever),
            onPressed:
                trashedRM.trashed.isEmpty ? null : () => trashedRM.deleteAll(),
          ).pad(right: 8),
        ],
      ),
      body: trashedRM.trashed.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete_forever,
                    size: 120,
                    color: Colors.amber,
                  ),
                  'Trash is empty for now'.text(),
                ],
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                  color: Theme.of(context).primaryColor),
              itemCount: trashedRM.trashed.length,
              itemBuilder: (context, index) {
                final note = trashedRM.trashed.elementAt(index);
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.details),
                  leading: IconButton(
                    tooltip: "Restore",
                    icon: Icon(Icons.restore_from_trash),
                    onPressed: () => trashedRM.restoreNote(note),
                  ).pad(right: 8),
                  trailing: IconButton(
                    tooltip: "Permanently Delete",
                    icon: Icon(Icons.delete_forever),
                    onPressed: () => trashedRM.permanentlyDeleteNote(note),
                  ).pad(right: 8),
                ).pad();
              },
            ),
    );
  }
}
