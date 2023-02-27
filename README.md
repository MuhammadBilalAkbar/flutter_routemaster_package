## 1. Research: Flutter RouteMaster Package

- Keywords:
    - flutter routemaster
    - nested navigation in flutter
    - routing in flutter
    - flutter GoRouter example
    - flutter route guard
    - flutter auto route nested
    - routemaster flutter github
    - flutter navigator 2.0 example github
    - flutter nested bottom navigation
    - flutter multiple navigators
    - flutter routing best practices
    - flutter navigation package
    - flutter navigation and routing
    - flutter custom route
    - flutter routing
- Video Title: Flutter RouteMaster - Navigation and routing with observers, guarded routes, and navigation without context

## 2. Research: Competitors

**Flutter Videos/Articles**

- 556: https://www.youtube.com/watch?v=DMgB29xBaxg
- 28: https://www.youtube.com/watch?v=AWa2FFDPh0I
- https://pub.dev/packages/routemaster
- https://morioh.com/p/016a91402d7b
- https://www.reddit.com/r/FlutterDev/comments/my6tk5/routemaster_easytouse_navigator_20_wrapper/

**Android/Swift/React Videos**

- 2.5K: https://www.youtube.com/watch?v=TOhDMrzNRUo
- 12K: https://www.youtube.com/watch?v=67Xmgqe-wLU
- 9.7K: https://www.youtube.com/watch?v=6sySblPWwBc
- 1.4K: https://www.youtube.com/watch?v=fMO_kzETMiY
- 6.3K: https://www.youtube.com/watch?v=Xd0J18isFEQ
- 2.1K: https://www.youtube.com/watch?v=QZKA4fyJerI
- https://developer.android.com/training/cars/apps/navigation
- https://docs.mapbox.com/android/navigation/guides/
- https://medium.com/mobile-app-development-publication/workaround-navigation-component-string-based-route-with-xml-bottom-bar-navigation-9bc7a07437f6
- https://www.javatpoint.com/flutter-navigation-and-routing
- https://medium.com/swlh/an-easy-to-use-routing-system-in-swift-37e7e2d5259
- https://medium.com/bumble-tech/routing-for-ios-universal-navigation-without-rewriting-the-app-215b52a37cf2
- https://clean-swift.com/routing-in-clean-swift/
- https://shinesolutions.com/2021/08/20/swiftui-navigation/
- https://iosexample.com/easy-and-maintainable-app-navigation-with-path-based-routing-for-swiftui/

**Great Features**
- Easy-to-use Navigator 2.0 router for web, mobile and desktop. URL-based routing, simple navigation of tabs and nested routes.
- You can find more at [pub.dev](https://pub.dev/packages/routemaster).

**Problems from Videos**
- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/64617894/flutter-how-to-handle-back-button-press-when-using-navigator-with-pages

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. Easy-to-use Navigator 2.0 router for web, mobile and desktop. URL-based routing, simple navigation of tabs and nested routes.
2. Main Points
    - Give `routerDelegate` and `routeInformationParser` to `MaterialApp.router` in your project.
    - You can pass query parameters, observe navigation, guard routes, 404 not found handling and navigate without context.
3. This is very useful package and easy to use for web, mobile and desktop.

**The Structured Main Content**
1. Run `flutter pub get routmaster` in your terminal to add this package in your `pubspec.yaml` file. Import `import 'package:routemaster/routemaster.dart';` to use it anywhere in your project.
2. There is no need of setup for Android and iOS.
3. In `main.dart` file, `MyApp()` is being called.
4. In `my_app.dart` file, instead of normal MaterialApp `MaterialApp.router` is being returned which wrapped by `ExcludeSemantics` to avoid bugs in flutter web.
```dart
  @override
  Widget build(BuildContext context) => ExcludeSemantics(
        // ExcludeSemantics is a work-around for a bug in Flutter web engine
        child: MaterialApp.router(
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'Flutter RouteMaster Package',
        ),
      );
```
For this router, `routeInformationParser` is set to `RoutemasterParser()` which initializes a parser that works in conjunction with `RoutemasterDelegate`.
<br />routerDelegate is defined as:
```dart
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
      onUnknownRoute: (_) => const MaterialPage(child: NotFoundPage()),
      // onUnknownRoute: (_) => const Redirect('/'),
    ),
```
`RoutemasterDelegate` requires `routesBuilder`. All other parameters are optional. `onUnknownRoute`, any page can be set or you can `Redirect` to specific route which is defined in routes builder.
For tabs `CupertinoTabPage` is defined in `routes` which is calling `TabbedPage` from `tabbed_page.dart`.
5. `export_all_pages.dart` exports all pages to `my_app.dart` to define routes.
6. `route_master_page.dart` and `page_one.dart` are similar, `Routemaster.of(context).push('/namedRoute')` and `Routemaster.of(context).replace('/namedRoute')` are called.
<br />`replace` Replaces the current route with path. On the web, this prevents the user returning to the previous route via the back button.
<br />`push` Navigates to path. If this path starts with a forward slash, it's treated as an absolute path. Otherwise it's handled as a path relative to the current route.
<br />You can use `queryParameters` get Query parameters from the path. e.g. /page?hello=world becomes queryParameters<code>'hello'</code> == 'world'
<br />Example of `onUnknownRoute` is given in last button of `route_master_page.dart`.
```dart
              ElevatedButton(
                onPressed: () => Routemaster.of(context).replace('/asdf'),
                // 'asdf' is not defined in RoutesBuilder.
                child: const Text('Unknown route'),
              ),
```
7. `page_one.dart` and `private_page.dart` are simple and similar. `private_page.dart` accepts String `message` as query to show on page.
8. In `tabbed_page.dart`, `CupertinoTabScaffold` is being returned. `tabBar` and `tabBuilder` are required parameters. `tabBar` contains two children which are defined in `my_app.dart` `routes` property as `CupertinoTabPage` with `paths: ['/tabs/one', '/tabs/two'],`