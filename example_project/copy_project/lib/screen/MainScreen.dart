import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/widget/ui_widget/CircleLine.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/ActiveChannel.dart';
import '../widget/PttButton.dart';
import 'ConversationScreen.dart';
import '../widget/ui_widget/HorizontalLine.dart';
import '../widget/item/TabItem.dart';
import '../common/TabNavigator.dart';

final currentTabProvider = StateProvider<TabItem>((ref) => TabItem.group);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with CommonProvider {
  final tabs = TabItem.values;
  late final List<GlobalKey<NavigatorState>> navigatorKeys =
      TabItem.values.map((e) => GlobalKey<NavigatorState>()).toList();

  TabItem get _currentTab => ref.watch(currentTabProvider);

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;

  @override
  void initState() {
    Get.put(KeyboardHeight());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: _AppBar(),
            extendBody: extendBody,
            //bottomNavigationBar 아래 영역 까지 그림
            // drawer: const MenuDrawer(),
            // drawerEnableOpenDragGesture: !Platform.isIOS,
            body: Container(
              padding: EdgeInsets.only(bottom: extendBody ? 60 - 30 : 0),
              child: SafeArea(
                bottom: !extendBody,
                // child: pages,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // active channel bar
                        ActiveChannel(),
                        Expanded(child: pages),
                      ],
                    ),
                    Positioned(
                      bottom: keyboardHeight.height.value + 90, // 높이 조정이 필요해보임.
                      left: 0,
                      right: 0,
                      child: const PttButton(),
                    ),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              child: BottomNavigationBar(
                items: navigationBarItems(context),
                currentIndex: _currentIndex,
                onTap: _handleOnTapNavigationBarItem,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      title: "FirstNet_Copy".text.make(),
      leading: Icon(Icons.menu),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emergency,
              color: Colors.red,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
            )),
      ],
    );
  }

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

  void _changeTab(int index) {
    ref.read(currentTabProvider.notifier).state = tabs[index];
  }
}
