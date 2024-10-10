import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todys_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

/// with 키워드로 어떠한 Widget 을 사용할 때에 'this' 키워드가 먹지 않을 때가 있음.
/// `class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
/// final TabController tabController = TabController(length : 2, vsync:this);
/// ...
/// }`
/// 그 이유는 class 가 생성되면서 final 변수도 생성되는데,
/// class 가 생성되는 과정에서 참조를 하려고하니 에러가 발생.
/// 그래서 주로 사용하는 방법은 initState 함수 안에 초기화를 한다.
/// `class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
///   TabController? tabController;
///
///   @override
///   void initState() {
///     tabController = TabController(length: 2, vsync: this);
///     super.initState();
///   }
///   ...
///   }
///   `

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  /// 코틀린의 lateinit 키워드처럼 해당 변수를 실제로 사용하고자 할때 초기화 하는 방법.
  late final TabController tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.appColors.roundedLayoutBackground,
            pinned: true,
            actions: [
              ImageButton(
                imagePath: "$basePath/icon/stock_search.png",
                onTap: () {
                  context.showSnackbar("Search Click!");
                },
              ),
              ImageButton(
                imagePath: "$basePath/icon/stock_calendar.png",
                onTap: () {
                  context.showSnackbar("Calendar Click!");
                },
              ),
              ImageButton(
                imagePath: "$basePath/icon/stock_settings.png",
                onTap: () {
                  context.showSnackbar("Settings Click!");
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              /// 그릴 위젯이 많으면 그냥 일단 뭐뭐 만들어야할지 적어놓고 시작을한다.
              /// title
              /// tabBar
              /// myAccount
              /// height20(구분되는 영역 ex. divider)
              /// myStocks
              title,
              tabBar,
              if (currentIndex == 0) const MyStockFragment() else const TodaysDiscoveryFragment()
              // myAccount,
              // height10,
              // myStocks,
            ],
          ))
        ],
      ),
    );
  }

  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            "토스 증권".text.size(24).bold.make(),
            width20,
            "S&P 500".text.size(13).bold.color(context.appColors.lessImportant).make(),
            width10,
            3929.23.toComma().text.size(13).color(context.appColors.plus).make()
          ],
        ).pOnly(left: 20),
      );

  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  this.currentIndex = index;
                });
              },
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelPadding: const EdgeInsets.symmetric(vertical: 20),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              controller: tabController,
              isScrollable: false,
              tabs: [
                "내 주식".text.white.make(),
                "오늘의 발견".text.white.make(),
              ],
            ),
            const Line()
          ],
        ),
      );

  Widget get myAccount => Placeholder();

  Widget get myStocks => Placeholder();
}
