import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';

class Stock extends PopularStock  {
  final String stockImagePath;

  Stock(
      {required this.stockImagePath,
      required super.yesterdayClosePrice, /// 상속 받는 class 에서도 추상화 클래스 접근이 가능해서 실질적으로 가공된 값을 확인 할 수 있다.
      required super.currentPrice,
      required super.stockName});
}
