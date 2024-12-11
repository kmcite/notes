import 'package:notes/main.dart';

final Injected<NavigationState> navigationRM = RM.injectStream(
  () => navigationRepository.watchNavigation().map(
    (page) {
      if (page != null)
        return navigationRM.state.copyWith(
          drawerIndex: DrawerNavigationTargets.contains(page)
              ? DrawerNavigationTargets.indexOf(page)
              : navigationRM.state.drawerIndex,
          bottomBarIndex: BottomNavigationTargets.contains(page)
              ? BottomNavigationTargets.indexOf(page)
              : navigationRM.state.bottomBarIndex,
        );
      return navigationRM.state;
    },
  ),
  initialState: NavigationState(
    drawerIndex: 0,
    bottomBarIndex: 0,
    router: navigationRepository.router,
  ),
);
void drawerNavigationRequested(int index) {
  final page = DrawerNavigationTargets[index];
  navigationRepository.navigateTo(page);
}

void bottomBarNavigationRequested(int index) {
  final page = BottomNavigationTargets[index];
  navigationRepository.navigateTo(page);
}

void navigateToNotePage(int id) => navigationRepository.navigateToNote(id);

class NavigationState {
  final int drawerIndex;
  final int bottomBarIndex;
  final GoRouter router;

  NavigationState({
    required this.drawerIndex,
    required this.bottomBarIndex,
    required this.router,
  });

  NavigationState copyWith({
    int? drawerIndex,
    int? bottomBarIndex,
  }) {
    return NavigationState(
      drawerIndex: drawerIndex ?? this.drawerIndex,
      bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex,
      router: router,
    );
  }
}
