import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_routemaster_package/pages/route_master_page.dart';

import 'pages/export_all_pages.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
      routes: {
        '/': (_) => const MaterialPage(child: RouteMasterPage()),
        '/one': (_) => const MaterialPage(child: PageOne()),
        '/two': (_) => const MaterialPage(child: PageTwo()),
        '/one/two': (_) => const MaterialPage(child: PageTwo()),
        '/tabs': (_) => const CupertinoTabPage(
              child: TabbedPage(),
              paths: ['/tabs/one', '/tabs/two'],
            ),
        '/tabs/one': (_) => const MaterialPage(child: PageOne()),
        '/tabs/two': (_) => const MaterialPage(child: PageTwo()),
        '/_private': (route) => MaterialPage(
              child: PrivatePage(
                message: route.queryParameters['message'],
              ),
            ),
      },
      onUnknownRoute: (route) => const MaterialPage(child: NotFoundPage()),
      // //You can also redirect
      // onUnknownRoute: (_) => const Redirect('/'),
    ),
  );

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
        // ExcludeSemantics is a work-around for a bug in Flutter web engine
        child: MaterialApp.router(
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'Flutter RouteMaster Package',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            textTheme: const TextTheme(
              labelLarge: TextStyle(fontSize: 30),
              titleMedium: TextStyle(fontSize: 30),
              bodySmall: TextStyle(fontSize: 20),
              bodyLarge: TextStyle(fontSize: 30),
              bodyMedium: TextStyle(fontSize: 25),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      );
}
