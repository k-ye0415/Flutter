import 'dart:io';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:fast_app_base/screen/main/tab/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/common.dart';
import 'fab/w_floating_daangn_button.dart';
import 'w_menu_drawer.dart';

final currentTabProvider = StateProvider<TabItem>((ref) => TabItem.home);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> with SingleTickerProviderStateMixin {
  final tabs = TabItem.values;
  late final List<GlobalKey<NavigatorState>> navigatorKeys =
      TabItem.values.map((e) => GlobalKey<NavigatorState>()).toList();

  TabItem get _currentTab => ref.watch(currentTabProvider);

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;

  static double get bottomNavigationBarBorderRadius => 30.0;
  static const double bottomNavigationBarHeight = 60;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handleBackPressed(true),
      child: Material(
        child: Stack(
          children: [
            Scaffold(
              extendBody: extendBody,
              //bottomNavigationBar 아래 영역 까지 그림
              drawer: const MenuDrawer(),
              // drawerEnableOpenDragGesture: !Platform.isIOS,
              body: Container(
                padding: EdgeInsets.only(
                    bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
                child: SafeArea(
                  bottom: !extendBody,
                  child: pages,
                ),
              ),
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: _buildBottomNavigationBar(context),
            ),
            AnimatedOpacity(
              opacity: _currentTab != TabItem.chat ? 1 : 0,
              duration: 300.ms,
              child: FloatingDaangnButton(),
            ),
          ],
        ),
      ),
    );
  }

  bool get isRootPage =>
      _currentTab == TabItem.home && _currentTabNavigationKey.currentState?.canPop() == false;

  IndexedStack get pages => IndexedStack(
      index: _currentIndex,
      children: tabs
          .mapIndexed((tab, index) => Offstage(
                offstage: _currentTab != tab,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[index],
                  tabItem: tab,
                ),
              ))
          .toList());

  Future<bool> _handleBackPressed(bool didPop) async {
    if (!didPop) {
      // Your existing logic for handling back press goes here
      if (_currentTabNavigationKey.currentState?.canPop() == true) {
        Nav.pop(_currentTabNavigationKey.currentContext!);
        return true; // Allow navigation if pop succeeds
      }

      if (_currentTab != TabItem.home) {
        _changeTab(tabs.indexOf(TabItem.home));
      }
      return false; // Prevent navigation if pop fails or tab change occurs
    }
    return false; // Default behavior if didPop is true
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: Platform.isIOS ?bottomNavigationBarHeight + 40 : bottomNavigationBarHeight,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          items: navigationBarItems(context),
          currentIndex: _currentIndex,
          selectedItemColor: context.appColors.text,
          unselectedItemColor: context.appColors.iconButtonInactivate,
          onTap: _handleOnTapNavigationBarItem,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (tab, index) => tab.toNavigationBarItem(
            context,
            isActivated: _currentIndex == index,
          ),
        )
        .toList();
  }

  void _changeTab(int index) {
    ref.read(currentTabProvider.notifier).state = tabs[index];
  }

  BottomNavigationBarItem bottomItem(
      bool activate, IconData iconData, IconData inActivateIconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(label),
          activate ? iconData : inActivateIconData,
          color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: label);
  }

  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];
    if (oldTab == targetTab) {
      final navigationKey = _currentTabNavigationKey;
      popAllHistory(navigationKey);
    }
    _changeTab(index);
  }

  void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop();
      }
    }
  }
}
