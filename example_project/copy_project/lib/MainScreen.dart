import 'package:copy_project/CircleLine.dart';
import 'package:copy_project/TabWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ConversationScreen.dart';
import 'HorizontalLine.dart';
import 'TabItem.dart';
import 'TabNavigator.dart';

final currentTabProvider = StateProvider<TabItem>((ref) => TabItem.group);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final tabs = TabItem.values;
  late final List<GlobalKey<NavigatorState>> navigatorKeys =
      TabItem.values.map((e) => GlobalKey<NavigatorState>()).toList();

  TabItem get _currentTab => ref.watch(currentTabProvider);

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;

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
                    const Positioned(
                      bottom: 80,
                      left: 0,
                      right: 0,
                      child: PttButton(),
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

class PttButton extends StatelessWidget {
  const PttButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        CircleLine(
          radius: 140.0,
          child: Icon(
            Icons.call,
            size: 60,
          ),
        )
      ],
    );
  }
}

class ActiveChannel extends StatelessWidget {
  const ActiveChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: (){
        Nav.push(const ConversationScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalLine(
            height: 3,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 11, bottom: 11, left: 16),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.call),
                        "GroupName".text.make(),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call_made_outlined),
                        "UserName".text.make(),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 11, bottom: 11, left: 16),
                width: 47,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: Center(
                  child: "End".text.bold.white.make(),
                ),
              ).pOnly(right: 16),
            ],
          ),
          HorizontalLine(
            height: 3,
          ),
        ],
      ),
    );
  }
}
