import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          height: 399,
          color: Colors.amber[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.amber[100],
        ),Container(
          height: 399,
          color: Colors.green,
        ),Container(
          height: 399,
          color: Colors.amber[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.amber[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),


      ],
    );
  }
}
