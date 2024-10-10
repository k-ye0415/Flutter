import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 해당 클래스를 추상화를 진행하고,
abstract mixin class StockPercentageDataProvider {
  /// 해당 변수 즉 가공해야하는 값들이 있다고 가정한 후에 'get'키워드를 사용.
  int get currentPrice;

  int get yesterdayClosePrice;

  /// data class 에는 data 만 가지고 있는게 좋기 때문에
  /// data class 의 값을 가공할 함수는 따로 빼서 사용하는게 좋다.
  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);

  String get todayPercentageString => "${symbol}$todayPercentage%";

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame
      ? ""
      : isPlus
          ? "+"
          : "-";

  Color getPriceColor(BuildContext context) => isSame
      ? context.appColors.lessImportant
      : isPlus
          ? context.appColors.plus
          : context.appColors.minus;
}
