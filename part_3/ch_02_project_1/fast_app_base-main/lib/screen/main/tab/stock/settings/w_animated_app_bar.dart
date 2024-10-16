import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.scrollController,
    required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  // final duration = 10.ms;
  Duration get duration => 10.ms;
  double scrollPosition = 0;

  // late Animation animation = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
  late CurvedAnimation animation =
      CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {});
    });
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.roundedLayoutBackground,
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
                color: Colors.white,
              ),
            ).p20(),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: getValue(30, 15)),
                  duration: duration,
                  child: widget.title.text.white.make()),
            ),
            Positioned(
                left: animation.value * 200,
                child: TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: Colors.green,
                    end: isTriggered ? Colors.orange : Colors.green,
                  ),
                  duration: 1000.ms,
                  builder: (context, value, child) => ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      value ?? Colors.green,
                      BlendMode.modulate,

                      /// color 필터링
                    ),
                    child: child,
                  ),
                  child: Image.asset(
                    "$basePath/icon/map_point.png",
                    height: 30,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
