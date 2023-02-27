import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

class TabbedPage extends StatelessWidget {
  const TabbedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        controller: CupertinoTabPage.of(context).controller,
        tabBuilder: CupertinoTabPage.of(context).tabBuilder,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(CupertinoIcons.list_bullet),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(CupertinoIcons.search),
            ),
          ],
        ),
      );
}
