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
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationRM.state.bottomBarIndex,
        onDestinationSelected: bottomBarNavigationRequested,
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
      ),
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: body,
    );
  }
}
