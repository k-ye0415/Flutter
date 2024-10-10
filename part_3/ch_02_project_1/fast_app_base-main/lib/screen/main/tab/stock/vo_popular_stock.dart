import 'package:fast_app_base/screen/main/tab/stock/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider {
  /// 추상화 클래스를 with 함수로 묶어
  /// 추상화 클래스에 있던 변수를 override 한다.
  /// 이렇게 되면, 해당 클래스에서 값을 받은 후 가공해야하는 함수들은 추상화 클래스에서 접근 가능하다.
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  /// 생성자 안에 {} 를 사용하게되면 namedParam이 된다.!!!!!!!!!!
  PopularStock(
      {required this.yesterdayClosePrice, required this.currentPrice, required String stockName})
                                                                      /// 상위 객체인 SimpleStock 생성자는 namedParam 이 아니기때문에 새로이 만들어
      : super(stockName);
      /// super 생성자에 전달해준다.
}
