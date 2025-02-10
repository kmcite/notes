import 'package:notes/main.dart';

final NavigationBloc navigationBloc = NavigationBloc();

class NavigationBloc {
  late final Injected<NavigationState> navigationRM = RM.injectStream(
    () => navigationRepository.watchNavigation().map(
      (page) {
        final isDrawerPage = DrawerNavigationTargets.contains(page);
        final isBottomBarPage = BottomNavigationTargets.contains(page);
        return navigationRM.state.copyWith(
          drawerIndex:
              isDrawerPage ? DrawerNavigationTargets.indexOf(page!) : null,
          bottomBarIndex: isBottomBarPage
              ? BottomNavigationTargets.indexOf(page!)
              : navigationRM.state.bottomBarIndex,
          page: () => page,
        );
      },
    ),
    initialState: NavigationState(
      drawerIndex: 0,
      bottomBarIndex: 0,
      router: navigationRepository.router,
    ),
  );

  Pages? get page => navigationRM.state.page;
  int get bottomBarIndex => navigationRM.state.bottomBarIndex;
  int? get drawerIndex => navigationRM.state.drawerIndex;
  GoRouter get router => navigationRM.state.router;

  void drawerNavigationRequested(int index) {
    navigationRepository.navigateTo(DrawerNavigationTargets[index]);
  }

  void bottomBarNavigationRequested(int index) {
    navigationRepository.navigateTo(BottomNavigationTargets[index]);
  }

  void navigateToNotePage(int id) => navigationRepository.navigateToNote(id);

  void navigateToReminderPage(int id) {
    navigationRepository.navigateToReminder(id);
  }

  void navigateTo(Pages page) => navigationRepository.navigateTo(page);
  get extra => router.state?.extra;
}

class NavigationState {
  final int? drawerIndex;
  final int bottomBarIndex;
  final GoRouter router;
  final Pages? page;
  NavigationState({
    required this.drawerIndex,
    required this.bottomBarIndex,
    required this.router,
    this.page,
  });

  NavigationState copyWith({
    int? drawerIndex,
    int? bottomBarIndex,
    Pages? Function()? page,
  }) {
    return NavigationState(
      drawerIndex: drawerIndex,
      bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex,
      router: router,
      page: page?.call() ?? this.page,
    );
  }
}
