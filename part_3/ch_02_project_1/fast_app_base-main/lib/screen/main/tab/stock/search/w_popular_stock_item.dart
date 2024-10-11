import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';

import '../vo_stock.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int index;

  const PopularStockItem({super.key, required this.stock, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: index.toString().text.size(15).make(),
        ),
        width30,
        stock.name.text.size(15).make(),
        emptyExpanded,
        stock.todayPercentageString.text.color(stock.getPriceColor(context)).size(15).make(),
      ],
    ).pSymmetric( v: 25);
  }
}
