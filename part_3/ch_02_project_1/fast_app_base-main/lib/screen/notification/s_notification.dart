import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:fast_app_base/screen/notification/d_notification.dart';
import 'package:fast_app_base/screen/notification/notification_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.appBarBackground,
      body: CustomScrollView(
        slivers: [
          /// 원래 보통 위젯은 하단에 적힌 위젯이 최상위 위젯이 되지만,
          /// 해당 위젯의 slivers 는 가장 위에 적힌 위젯이 최상위 위젯이 된다.
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text(
              "알림",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: false,
            backgroundColor: context.appColors.appBarBackground,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => NotificationItemWidget(
              notification: notificationDummies[index],
              onTap: () {
                NotificationDialog([notificationDummies[0], notificationDummies[1]]).show();
              },
            ),
            childCount: notificationDummies.length,
          ))
        ],
      ),
    );
  }
}
