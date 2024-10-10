import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_long_button.dart';
import '../stock_dummy.dart';
import '../w_interest_stock.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStock(context),
      ],
    );
  }

  /// Widget get myStock  -> widget 이 반환되는 widget 변수
  /// Widget getMyStock(...) -> widget 이 반환되는 함수

  Widget getMyAccount(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            "계좌".text.make(),
            Row(
              children: [
                "4442원".text.size(24).bold.make(),
                Arrow(),
                emptyExpanded,
                RoundedContainer(
                  child: "채우기".text.size(12).make(),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  background: context.appColors.buttonBackground,
                ),
              ],
            ),
            height30,
            Line(
              color: context.appColors.divider,
            ),
            height10,
            LongButton(
              title: "주문내역",
              onTap: () {},
            ),
            LongButton(
              title: "판매수익",
              onTap: () {},
            ),
          ],
        ),
      );

  Widget getMyStock(BuildContext context) => Column(
        children: [
          Container(
            color: context.appColors.roundedLayoutBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  height30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    /// 이렇게 써도 되고~
                    children: [
                      "관심 주식".text.bold.size(20).make(),
                      // emptyExpanded, /// 만들어놓은거 사용해도되고,
                      "편집하기".text.color(context.appColors.lessImportant).make(),
                    ],
                  ),
                  height20,
                  Tap(
                    onTap: () {
                      context.showSnackbar("message");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          "기본".text.make(),
                          emptyExpanded,
                          Arrow(
                            direction: AxisDirection.up,
                            color: context.appColors.lessImportant,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const InterestStockList().pSymmetric(h: 20),
        ],
      );
}
