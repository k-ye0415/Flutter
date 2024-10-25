import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

import 'MainScreen.dart';

class App extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with Nav {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: const MainScreen(),
      ),
    );
  }
}
