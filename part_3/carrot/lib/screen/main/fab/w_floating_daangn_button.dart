import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/write/s_write.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tab/tab_item.dart';

class FloatingDaangnButton extends ConsumerWidget {
  FloatingDaangnButton({super.key});

  final duration = 300.ms;
  static const height = 120.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
    return Stack(
      children: [
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: duration,
            color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedOpacity(
                opacity: isExpanded ? 1 : 0,
                duration: duration,
                child: Column(
                  children: [
                    Container(
                      width: 160,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: context.appColors.floatingActionLayer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          _floatItem("알바", "$basePath/fab/fab_01.png"),
                          _floatItem("과외/클래스", "$basePath/fab/fab_02.png"),
                          _floatItem("농수산물", "$basePath/fab/fab_03.png"),
                          _floatItem("부동산", "$basePath/fab/fab_04.png"),
                          _floatItem("중고차", "$basePath/fab/fab_05.png"),
                        ],
                      ),
                    ),
                    const Height(5),
                    Tap(
                      onTap: () {
                        Nav.push(const WriteScreen());
                      },
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(right: 15, bottom: 10),
                        decoration: BoxDecoration(
                          color: context.appColors.floatingActionLayer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            _floatItem("내 물건 팔기", "$basePath/fab/fab_06.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tap(
                onTap: () {
                  // final currentTab = ref.read(currentTabProvider);
                  // switch (currentTab) {
                  //   case TabItem.home:
                  //   case TabItem.localLife:
                  //   case TabItem.nearMe:
                  //   case TabItem.chat:
                  //   case TabItem.my:
                  // }
                  ref.read(floatingButtonStateProvider.notifier).toggleMenu();
                },
                child: AnimatedContainer(
                  duration: duration,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: isExpanded
                        ? context.appColors.floatingActionLayer
                        : const Color(0xffff791f),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                        turns: isExpanded ? 0.125 : 0,
                        duration: duration,
                        child: Icon(Icons.add),
                      ),
                      AnimatedWidthCollapse(
                        visible: !isSmall,
                        child: "글쓰기".text.make(),
                        duration: duration,
                      )
                    ],
                  ),
                ),
              ).pOnly(
                  bottom: MainScreenState.bottomNavigationBarBorderRadius +
                      context.viewPaddingBottom +
                      40,
                  right: 20),
            ],
          ),
        )
      ],
    );
  }

  _floatItem(String title, String imagePath) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 30,
        ),
        const Width(8),
        title.text.make(),
      ],
    );
  }
}
