import 'package:fast_app_base/screen/main/tab/stock/stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/w_stock_item.dart';
import 'package:flutter/material.dart';

class InterestStockList extends StatelessWidget {
  const InterestStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...myInterestStock.map((e) => StockItem(e)).toList()
      ],
    );
  }
}
