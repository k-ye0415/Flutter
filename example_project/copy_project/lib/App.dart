import 'package:copy_project/common/theme/CustomThemeApp.dart';
import 'package:copy_project/screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

import 'screen/MainScreen.dart';

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
      child: CustomThemeApp(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              home: const LoginScreen(),
            );
          },
        ),
      ),
    );
  }
}
