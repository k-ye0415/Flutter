import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fab/w_floating_daangn_button.riverpod.dart';

class LocalLifeFragment extends ConsumerStatefulWidget {
  const LocalLifeFragment({super.key});

  @override
  ConsumerState<LocalLifeFragment> createState() => _LocalLifeFragmentState();
}

class _LocalLifeFragmentState extends ConsumerState<LocalLifeFragment> {
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
        Image.network("https://picsum.photos/id/789/200/200"),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
        Container(
          height: 399,
          color: Colors.red[100],
        ),
        Container(
          height: 399,
          color: Colors.green[100],
        ),
      ],
    );
  }
}
