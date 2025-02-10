import 'package:notes/main.dart';

class AppScaffold extends UI {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final AppBar? appBar;

  AppScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationTargets.contains(navigationBloc.page)
          ? NavigationBar(
              selectedIndex: navigationBloc.bottomBarIndex,
              onDestinationSelected:
                  navigationBloc.bottomBarNavigationRequested,
              destinations: [
                ...BottomNavigationTargets.map(
                  (page) {
                    return NavigationDestination(
                      label: page.name,
                      icon: page.name[0].toUpperCase().text(),
                    );
                  },
                ),
              ],
            )
          : bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: body,
    );
  }
}
