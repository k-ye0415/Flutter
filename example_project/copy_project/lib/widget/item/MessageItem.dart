import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/common/extension/DateTimeExtension.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/message/Message.dart';
import '../ui_widget/CommonWidget.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final isIncoming = message.direction == Direction.incoming;
    return Align(
      alignment: isIncoming ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          // display Name
          message.displayName.text.color(Colors.white).make().pOnly(bottom: 2),
          // message info
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // outgoing -> time, icon
              isIncoming
                  ? goneWidget
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        message.messageType == MessageType.emergencyAlert
                            ? Icon(
                                Icons.emergency,
                                color: Colors.red,
                                size: 16,
                              )
                            : goneWidget,
                        isIncoming ? goneWidget : message.sendTime.formattedTime.text.color(Colors.white).make(),
                      ],
                    ).pOnly(right: 4),
              // bubble
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: message.messageType == MessageType.emergencyAlert
                      ? Colors.red
                      : isIncoming
                          ? context.appColors.incomingBubble
                          : context.appColors.outgoingBubble,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: isIncoming ? Radius.circular(0) : Radius.circular(10),
                    bottomRight: isIncoming ? Radius.circular(10) : Radius.circular(0),
                  ),
                ),
                // incoming -> time, icon
                child: Row(
                  children: [
                    if (message.mediaType != null)
                      if (message.mediaType == MediaType.voice)
                        Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 16,
                        )
                      else
                        Icon(
                          Icons.video_camera_back_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                    else
                      goneWidget,
                    message.message.text.color(Colors.white).make().pOnly(left: 2),
                  ],
                ),
              ),
              isIncoming
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        message.messageType == MessageType.emergencyAlert
                            ? Icon(
                                Icons.emergency,
                                color: Colors.red,
                                size: 16,
                              )
                            : goneWidget,
                        isIncoming ? message.sendTime.formattedTime.text.color(Colors.white).make() : goneWidget,
                      ],
                    ).pOnly(left: 4)
                  : goneWidget
            ],
          ),
        ],
      ).pOnly(left: isIncoming ? 8 : 0, right: isIncoming ? 0 : 8, bottom: 16),
    );
  }
}
