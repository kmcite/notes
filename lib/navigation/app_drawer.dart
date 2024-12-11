import 'package:notes/main.dart';

class AppDrawer extends UI {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navigationRM.state.drawerIndex,
      onDestinationSelected: drawerNavigationRequested,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tilePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary,
                colorScheme.secondary,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 30),
              Text(
                '${settingsBloc.userName()}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Notes App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ...DrawerNavigationTargets.map(
          (page) => NavigationDrawerDestination(
            icon: CircleAvatar(
              child: page.name[0].toUpperCase().text(),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            label: Text(page.path).pad(),
          ),
        ),
      ],
    );
  }
}
