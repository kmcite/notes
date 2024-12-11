import 'package:notes/main.dart';

class NotePage extends UI {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    Note note([Note? _]) {
      if (_ != null) context.of<NoteBloc>().submitToSave(_);
      return context.of<NoteBloc>().state!;
    }

    String title([title]) {
      if (title != null) note(note()..title = title);
      return note().title;
    }

    String details([details]) {
      if (details != null) note(note()..details = details);
      return note().details;
    }

    NoteStatus status([noteStatus]) {
      if (noteStatus != null) note(note()..status = noteStatus);
      return note().noteStatus;
    }

    return AppScaffold(
      appBar: AppBar(
        title: Text(note().title),
        actions: [
          IconButton(
            onPressed: () => drawerNavigationRequested(Pages.notes.index),
            icon: Icon(Icons.notes),
          ),
          IconButton.filledTonal(
            onPressed: () {
              notesRM.delete(note());
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ).pad(right: 8),
        ],
      ),
      bottomNavigationBar: NoteEditToolbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              key: ValueKey('title'),
              initialValue: title(),
              onChanged: title,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextFormField(
                key: ValueKey('details'),
                initialValue: details(),
                onChanged: details,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Details',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                minLines: 4,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status: ${status()}'),
                IconButton(
                  onPressed: () {
                    status(status() == 'Complete' ? 'Incomplete' : 'Complete');
                  },
                  icon: Icon(
                    status() == 'Complete' ? Icons.done : Icons.close,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Created on: ${note().timeCreated}'),
            SizedBox(height: 8),
            Text('Due date: ${note().dueDate}'),
            NoteEditToolbar(),
          ],
        ),
      ),
    );
  }
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NOTE EDIT TOOLBAR',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notes, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
