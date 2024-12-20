import 'package:fast_app_base/class/advanced/stream_test.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/w_banck_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import 's_number.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late final stream = countStream(5).asBroadcastStream();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          const LiveBackgroundWidget(
            palette: Palette(
              colors: [Colors.red, Colors.green],
            ),
            velocityX: 1,
            particleMaxSize: 20,
          ),
          RefreshIndicator(
            edgeOffset: TtossAppBar.appBarHeight,
            onRefresh: () async {
              await sleepAsync(500.ms);
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: TtossAppBar.appBarHeight,
                bottom: MainScreenState.bottomNavigationHeight,
              ),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: stream,
                    builder: (context, snapshot) {
                      final count = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                          return count!.text.bold.white.size(30).make();
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return CircularProgressIndicator();
                        case ConnectionState.done:
                          return "완료".text.bold.white.size(30).make();
                      }
                    },
                  ),
                  StreamBuilder(
                    stream: stream,
                    builder: (context, snapshot) {
                      final count = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                          return count!.text.bold.white.size(30).make();
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return CircularProgressIndicator();
                        case ConnectionState.done:
                          return "완료".text.bold.white.size(30).make();
                      }
                    },
                  ),
                  BigButton(
                    "토스뱅크",
                    onTap: () async {
                      print("start");
                      final result = await Nav.push(NumberScreen());
                      print(result);
                      print("end");
                    },
                  ),
                  height10,
                  RoundedContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "자산".text.bold.white.make(),
                      height5,
                      ...bankAccounts.map((e) => BankAccountWidget(e)).toList(),
                    ],
                  ))
                ],
              ).pSymmetric(h: 10).animate().slideY(duration: 1000.ms).fadeIn(),
            ),
          ),
          const TtossAppBar()
        ],
      ),
    );
  }

  Stream<int> countStream(int max) async* {
    await sleepAsync(2.seconds);
    for (int i = 1; i <= max; i++) {
      yield i;
      await sleepAsync(1.seconds);
    }
  }
}
