import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItem extends ConsumerStatefulWidget {
  final DaangnNotification notification;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  ConsumerState<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends ConsumerState<NotificationItem> {
  static const leftPadding = 15.0;
  static const iconWidth = 35.0;

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead ? context.backgroundColor : context.appColors.unRead,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Width(leftPadding),
            Image.asset(
              widget.notification.type.iconPath,
              width: iconWidth,
            ),
            width10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: widget.notification.title.text.make(),
                      ),
                      if (isEditMode)
                        IconButton(
                            onPressed: () {
                              final list = ref.read(notificationProvider);
                              if (list != null) {
                                list.remove(widget.notification);
                                ref.read(notificationProvider.notifier).state = List.of(list);
                              }
                            },
                            icon: Icon(Icons.delete))
                    ],
                  ),
                  height10,
                  widget.notification.description.text
                      .color(context.appColors.lessImportant)
                      .make(),
                  height10,
                  timeago
                      .format(widget.notification.time, locale: context.locale.languageCode)
                      .text
                      .color(context.appColors.lessImportant)
                      .make(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _NotificationItemState();
}
