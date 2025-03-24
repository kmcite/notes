// import 'package:notes/main.dart';
// import 'package:notes/notes/reminders/reminder/reminder_page.dart';
// import 'package:provider/provider.dart';

// import '../notes/news/news_page.dart';
// import '../notes/reminders/reminder/reminder_bloc.dart';

// const DrawerNavigationTargets = [
//   Pages.notes,
//   // Pages.reminders,
//   // Pages.settings,
//   Pages.archives,
//   Pages.trash,
//   Pages.feedback,
//   Pages.news,
// ];

// const BottomNavigationTargets = [
//   Pages.notes,
//   Pages.trash,
//   Pages.archives,
//   // Pages.settings,
// ];

// enum Pages {
//   notes,
//   archives(ArchivesPage()),
//   feedback(FeedbackPage()),
//   // settings(SettingsPage()),
//   // reminders(RemindersPage()),
//   // reminder(ReminderPage()),
//   // note(NotePage()),
//   // news(NewsPage()),
//   trash(TrashPage());

//   // const Pages([this.view = const NotesPage()]);
//   // final Widget view;
//   String call() => this.name;
//   String get path => "/${this.name}";
// }

// final navigationRepository = NavigationRepository();

// class NavigationRepository {
//   Stream<Pages?> watchNavigation() => _controller.stream;

//   final _controller = StreamController<Pages?>.broadcast();

//   NavigationRepository() {
//     router.routerDelegate.addListener(_listener);
//   }
//   final GoRouter router = GoRouter(
//     initialLocation: Pages.notes.path,
//     routes: [
//       ...List.generate(
//         DrawerNavigationTargets.length,
//         (index) => GoRoute(
//           name: DrawerNavigationTargets[index](),
//           path: DrawerNavigationTargets[index].path,
//           pageBuilder: (context, state) =>
//               NoTransitionPage(child: DrawerNavigationTargets[index].view),
//         ),
//       ),
//       GoRoute(
//         name: 'note',
//         path: '/note',
//         builder: (context, state) {
//           try {
//             // final noteId = state.extra as int;
//             return NotePage();
//           } catch (e) {
//             return Scaffold(
//               body: '404 $e'.text().center().pad(),
//             );
//           }
//         },
//       ),
//       GoRoute(
//         name: 'reminder',
//         path: '/remnder',
//         builder: (context, state) {
//           try {
//             final noteId = state.extra as int;
//             return ChangeNotifierProvider(
//               create: (context) => ReminderBloc()..load(noteId),
//               child: ReminderPage(),
//             );
//           } catch (e) {
//             return Scaffold(
//               body: '404 $e'.text().center().pad(),
//             );
//           }
//         },
//       ),
//     ],
//   );

//   void _listener() {
//     final page = Pages.values.firstWhere(
//       (p) => p.name == router.state?.name,
//       orElse: () => Pages.notes,
//     );
//     _controller.add(page);
//   }

//   void navigateTo(Pages page) {
//     router.goNamed(page.name);
//     _controller.add(page);
//   }

//   void navigateToNote(int id) {
//     _navigateWithExtra(Pages.note, extra: id);
//   }

//   void navigateToReminder(int id) {
//     _navigateWithExtra(Pages.reminder, extra: id);
//   }

//   void _navigateWithExtra(Pages page, {dynamic extra}) {
//     router.goNamed(page.name, extra: extra);
//     _controller.add(page);
//   }

//   void dispose() => _controller.close();
// }

// class NavigationException implements Exception {
//   final String message;
//   NavigationException(
//       [this.message = 'You wrongly navigated to a non-existent page.']);
// }
