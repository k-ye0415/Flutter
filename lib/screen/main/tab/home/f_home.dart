import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onLongPress: () {
                  Scaffold.of(context).openDrawer();
                },
                onTap: () async {
                  //Nav.push(const HomeFragment(), context: context);
                  // final result = await MessageDialog(context, "안녕하세요").show();
                  // debugPrint(result.toString());

                  final confirmDialogResult = await ConfirmDialog(
                    '오늘 기분이 좋나요?',
                    buttonText: "네",
                    cancelButtonText: "아니오",
                  ).show();
                  debugPrint(confirmDialogResult?.isSuccess.toString());

                  confirmDialogResult?.runIfSuccess((data) {
                    ColorBottomSheet(
                      '❤️',
                      context: context,
                      backgroundColor: Colors.yellow.shade200,
                    ).show();
                  });

                  confirmDialogResult?.runIfFailure((data) {
                    ColorBottomSheet(
                      '❤️힘내여',
                      backgroundColor: Colors.yellow.shade300,
                      textColor: Colors.redAccent,
                    ).show();
                  });
                },
                child: '홈'.text.white.size(20).make().centered()),
          ),
        ],
      ),
    );
  }
}
