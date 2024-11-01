import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/data/group/GroupDataProvider.dart';
import 'package:copy_project/screen/MenuDrawer.dart';
import 'package:copy_project/widget/EmergencyDialog.dart';
import 'package:copy_project/widget/ui_widget/CircleLine.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common/database/GroupviewModel.dart';
import '../widget/ActiveChannel.dart';
import '../widget/PttButton.dart';
import 'ConversationScreen.dart';
import '../widget/ui_widget/HorizontalLine.dart';
import '../widget/item/TabItem.dart';
import '../common/TabNavigator.dart';

final currentTabProvider = StateProvider<TabItem>((ref) => TabItem.group);
final searchQueryProvider = StateProvider<String>((ref) => "");
final groupViewModelProvider = ChangeNotifierProvider<GroupViewModel>((ref) {
  return GroupViewModel();
});

class MainScreen extends ConsumerStatefulWidget {
  final double keyboardHeight;

  const MainScreen(this.keyboardHeight, {super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with CommonProvider, GroupDataProvider {
  final tabs = TabItem.values;
  late final List<GlobalKey<NavigatorState>> navigatorKeys =
      TabItem.values.map((e) => GlobalKey<NavigatorState>()).toList();

  TabItem get _currentTab => ref.watch(currentTabProvider);

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;
  final searchController = TextEditingController();
  bool _isSearchMode = false;

  @override
  void initState() {
    Get.put(KeyboardHeight());
    Get.put(GroupData());
    setState(() {
      keyboardHeight.height.value = widget.keyboardHeight;
    });
    searchController.addListener(() {
      setState(() {
        ref.read(searchQueryProvider.notifier).state = searchController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupViewModelProvider);

    if (groupViewModel.groupList.isEmpty) {
      groupViewModel.loadGroups();
    }

    final emergencyGroup = groupViewModel.groupList
        .filter((group) => group.groupName.contains("Emergency"))
        .firstOrNull();
    groupData.emergencyGroup.value = emergencyGroup;

    final homeGroup =
    groupViewModel.groupList.filter((group) => group.groupName.contains("Home")).firstOrNull();
    groupData.homeGroup.value = homeGroup;
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: context.appColors.defaultBackground,
            appBar: _appBar(),
            extendBody: extendBody,
            drawer: const MenuDrawer(),
            //bottomNavigationBar 아래 영역 까지 그림
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
                        ActiveChannel(
                          group: groupData.homeGroup.value,
                        ),
                        Expanded(child: pages),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: extendBody ? 60 - 30 : 0,
                      child: Container(
                        height: keyboardHeight.height.value,
                        child: PttButton(
                          isVideoMode: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              child: BottomNavigationBar(
                selectedItemColor: Colors.orange,
                unselectedItemColor: Color(0xFFbfbfbf),
                // this.selectedIconTheme,
                // this.unselectedIconTheme,
                backgroundColor: Color(0xFF0b0b0b),
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

  AppBar _appBar() {
    return AppBar(
      title: _isSearchMode ? _searchArea() : "FirstNetCopy".text.make(),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      backgroundColor: context.appColors.appbarBackground,
      automaticallyImplyLeading: !_isSearchMode,
      actions: _isSearchMode
          ? null
          : [
              IconButton(
                  onPressed: () {
                    EmergencyDialog().show();
                  },
                  icon: Icon(
                    Icons.emergency,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearchMode = true;
                    });
                  },
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

  Container _searchArea() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Color(0xFF2d2e30),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchMode = false;
                searchController.clear();
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              cursorColor: context.appColors.pointColor,
              cursorWidth: 1,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: "Search group name",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8f8f8f),
                ),
              ),
            ).pSymmetric(v: 9),
          ),
          searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 24,
                  ),
                )
              : goneWidget
        ],
      ),
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
