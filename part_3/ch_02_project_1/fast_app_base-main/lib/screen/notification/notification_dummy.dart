import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notificationDummies = <TtossNotification>[
  TtossNotification(
    NotificationType.tossPay,
    "agohiewhg",
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.stock,
    "agohiewhg",
    DateTime.now().subtract(1.hours),
    isRead: true,
  ),
  TtossNotification(
    NotificationType.walk,
    "agohiewhg",
    DateTime.now().subtract(1.hours),
    isRead: true,
  ),
  TtossNotification(
    NotificationType.moneyTip,
    "agohiewhg",
    DateTime.now().subtract(8.hours),
  ),
  TtossNotification(
    NotificationType.walk,
    "agohiewhg",
    DateTime.now().subtract(11.hours),
  ),
  TtossNotification(
    NotificationType.luck,
    "agohiewhg",
    DateTime.now().subtract(12.hours),
  ),
  TtossNotification(
    NotificationType.people,
    "agohiewhg",
    DateTime.now().subtract(12.hours),
    isRead: true,
  ),
  TtossNotification(
    NotificationType.tossPay,
    "agohiewhg",
    DateTime.now().subtract(1.days),
  ),
  TtossNotification(
    NotificationType.tossPay,
    "agohiewhg",
    DateTime.now().subtract(2.days),
  ),
];
