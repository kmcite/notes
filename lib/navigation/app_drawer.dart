import 'package:notes/main.dart';
import 'package:notes/notes/news/news_bloc.dart';

class AppDrawer extends UI {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navigationBloc.drawerIndex,
      onDestinationSelected: navigationBloc.drawerNavigationRequested,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tilePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
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
              GestureDetector(
                onTap: settingsBloc.pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(settingsBloc.imageFile),
                ),
              ),
              Text(
                'Keep Notes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ).pad(),
              Text(
                '${settingsBloc.userName()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).pad(),
            ],
          ),
        ),
        ...DrawerNavigationTargets.map(
          (page) {
            if (page == Pages.news) {
              return NavigationDrawerDestination(
                icon: CircleAvatar(
                  foregroundColor: Colors.green,
                  child: CircleAvatar(
                    child: page.name[0].toUpperCase().text(),
                    backgroundColor:
                        newsBloc.newsAvailable ? Colors.red : Colors.green,
                  ),
                ),
                label: Text(page.path).pad(),
              );
            }

            return NavigationDrawerDestination(
              icon: CircleAvatar(
                child: page.name[0].toUpperCase().text(),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              label: Text(page.path).pad(),
            );
          },
        ),
      ],
    );
  }
}
