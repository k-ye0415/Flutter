import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider {
  /// mixin class 에서 사용되는 변수명은 유니크하게 작성하여 사용하는 것이 좋음.
  /// 해당 클래스를 with 하는 class 에서 같은 변수를 사용할 수 없음!
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stock = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock> [].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(["gg","zz","qq","tt"]);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>("/json/stock_list.json");
    stock.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stock.where((element) => element.name.contains(keyword)).toList();
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
    /// 간단한 기본타입은 list 에서 remove 가 편하지만, 객체를 받아와서 지울 때는 코틀린과 비슷함
    ///
    /// void remove(Stock stock) {
    ///    searchHistoryList.removeWhere((element) => element.key값 == stock.kye값);
    /// }
  }
}
