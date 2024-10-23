import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>> getNotification() async {
    await sleepAsync(300.ms);
    return SimpleResult.success(notificationList);
  }

  /// 또 다른 방법
  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(500.ms);
    return ProductPost(simpleProductPost: post1, content: "adb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.ziadb bugreport > /Users/ipguser/Documents/AndroidProject/Battery/bugreport.zi.");
  }
}
