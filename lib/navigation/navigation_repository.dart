import 'package:notes/main.dart';

const DrawerNavigationTargets = [
  Pages.notes,
  Pages.reminders,
  Pages.settings,
  Pages.archives,
  Pages.trash,
  Pages.feedback,
];

const BottomNavigationTargets = [
  Pages.notes,
  Pages.trash,
  Pages.archives,
  Pages.settings,
];

enum Pages {
  notes,
  archives(ArchivesPage()),
  feedback(FeedbackPage()),
  settings(SettingsPage()),
  reminders(RemindersPage()),
  note(NotePage()),
  trash(TrashPage());

  const Pages([this.view = const NotesPage()]);
  final Widget view;
  String call() => this.name;
  String get path => "/${this.name}";
}

final navigationRepository = NavigationRepository();

class NavigationRepository {
  NavigationRepository() {
    router.routerDelegate.addListener(_listener);
  }
  final GoRouter router = GoRouter(
    initialLocation: Pages.notes.path,
    routes: [
      ...List.generate(
        DrawerNavigationTargets.length,
        (index) => GoRoute(
          name: DrawerNavigationTargets[index](),
          path: DrawerNavigationTargets[index].path,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: DrawerNavigationTargets[index].view);
          },
        ),
      ),
      GoRoute(
        name: 'note',
        path: '/note',
        builder: (context, state) {
          try {
            final noteId = state.extra as int;

            return BlocProvider(
              create: (context) => NoteBloc()..load(noteId),
              child: NotePage(),
            );
          } catch (e) {
            return Scaffold(
              body: '404 $e'.text().center().pad(),
            );
          }
        },
      ),
    ],
  );

  final _controller = StreamController<Pages?>.broadcast();

  void _listener() {
    final page = Pages.values.firstWhere(
      (p) => p.name == router.state?.name,
      orElse: () => Pages.notes,
    );
    _controller.add(page);
  }

  void navigateTo(Pages page) {
    router.goNamed(page.name);
    _controller.add(page);
  }

  void navigateToNote(int id) {
    router.goNamed('note', extra: id);
  }

  Stream<Pages?> watchNavigation() => _controller.stream;

  void dispose() => _controller.close();
}

class NavigationException implements Exception {
  final String message;
  NavigationException(
      [this.message = 'You wrongly navigated to a non-existent page.']);
}
