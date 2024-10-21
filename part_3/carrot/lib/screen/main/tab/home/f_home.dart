import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/tab/home/w_product_post_item.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  late AnimationController _animationController;
  String title = "플루터동";
  bool isExpanded = false;

  @override
  void initState() {
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvider);
      if (scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 && floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });
    _animationController =
        AnimationController(vsync: this, duration: const Duration(microseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            // automaticallyImplyLeading: false,
            title: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  title = value;
                  _animationController.reverse();
                });
              },
              onCanceled: () {
                setState(() {
                  _animationController.reverse();
                });
              },
              onOpened: () {
                setState(() {
                  _animationController.forward();
                });
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text("다트"),
                  value: "다트",
                ),
                PopupMenuItem(
                  child: Text("앱"),
                  value: "앱",
                ),
              ],
              child: Row(
                children: [
                  Text(title),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animationController.value * 3.14,
                        child: Arrow(
                          direction: AxisDirection.down,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Nav.push(NotificationScreen());
                },
                icon: const Icon(Icons.notifications_none_rounded),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: FloatingDaangnButton.height),
              controller: scrollController,
              itemBuilder: (context, index) => ProductPostItem(post: postList[index]),
              itemCount: postList.length,
              separatorBuilder: (context, index) => const Line().pSymmetric(h: 15),
            ),
          ),
        ],
      ),
    );
  }
}
