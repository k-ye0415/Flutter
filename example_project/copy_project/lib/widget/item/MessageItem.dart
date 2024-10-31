import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/common/extension/DateTimeExtension.dart';
import 'package:copy_project/widget/ContextDialog.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/message/Message.dart';
import '../ui_widget/CommonWidget.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final Function(Message updateMsg)? onUpdateMessage;

  const MessageItem(
    this.message, {
    super.key,
    this.onUpdateMessage,
  });

  @override
  Widget build(BuildContext context) {
    return message.direction == Direction.outgoing
        ? _outgoingBubble(context, message)
        : _incomingBubble(context, message);
  }

  Widget _incomingBubble(BuildContext context, Message message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message.displayName.text.color(Colors.white).size(12).make().pOnly(bottom: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Tap(
                onTap: () {},
                onLongPress: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: message.messageType == MessageType.emergencyAlert
                        ? Colors.red
                        : message.messageType == MessageType.alertClear
                            ? Colors.white
                            : context.appColors.incomingBubble,
                    borderRadius: BorderRadius.only(
                      topRight: radius10,
                      bottomLeft: radius10,
                      bottomRight: radius10,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (message.mediaType != null)
                        Icon(
                          message.mediaType == MediaType.voice
                              ? Icons.call
                              : Icons.video_camera_back_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                      else
                        goneWidget,
                      Text(
                        message.message,
                        style: TextStyle(
                            color: message.messageType == MessageType.alertClear
                                ? Colors.red
                                : Colors.white,
                            fontWeight: message.messageType == MessageType.alertClear ||
                                    message.messageType == MessageType.emergencyAlert
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ).pOnly(left: 2),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  message.messageType == MessageType.emergencyAlert ||
                          message.messageType == MessageType.alertClear
                      ? Icon(
                          Icons.emergency,
                          color: Colors.red,
                          size: 16,
                        )
                      : goneWidget,
                  message.sendTime.formattedTime.text.size(10).color(Color(0xFF71757b)).make(),
                ],
              ).pOnly(left: 4),
            ],
          ),
        ],
      ).pOnly(left: 8),
    );
  }

  Widget _outgoingBubble(BuildContext context, Message message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.displayName.text.color(Colors.white).size(12).make().pOnly(bottom: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  message.messageType == MessageType.emergencyAlert ||
                          message.messageType == MessageType.alertClear
                      ? Icon(
                          Icons.emergency,
                          color: Colors.red,
                          size: 16,
                        )
                      : goneWidget,
                  message.sendTime.formattedTime.text.size(10).color(Color(0xFF71757b)).make(),
                ],
              ).pOnly(right: 4),
              Tap(
                onTap: () {},
                onLongPress: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: message.messageType == MessageType.emergencyAlert
                        ? Colors.red
                        : message.messageType == MessageType.alertClear
                            ? Colors.white
                            : context.appColors.outgoingBubble,
                    borderRadius: BorderRadius.only(
                      topLeft: radius10,
                      bottomLeft: radius10,
                      bottomRight: radius10,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (message.mediaType != null)
                        Icon(
                          message.mediaType == MediaType.voice
                              ? Icons.call
                              : Icons.video_camera_back_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                      else
                        goneWidget,
                      Text(
                        message.message,
                        style: TextStyle(
                            color: message.messageType == MessageType.alertClear
                                ? Colors.red
                                : Colors.white,
                            fontWeight: message.messageType == MessageType.alertClear ||
                                    message.messageType == MessageType.emergencyAlert
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ).pOnly(left: 2),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ).pOnly(right: 8),
    );
  }
}
