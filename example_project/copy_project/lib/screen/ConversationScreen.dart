import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/data/message/MessageDataProvider.dart';
import 'package:copy_project/widget/item/MessageItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/PttButton.dart';
import 'MainScreen.dart';

class ConversationScreen extends StatefulWidget {
  final String title;
  final String memberCount;

  const ConversationScreen({super.key, required this.title, required this.memberCount});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with CommonProvider, MessageDataProvider {
  @override
  void initState() {
    Get.put(KeyboardHeight());
    Get.put(MessageData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ConversationView height : ${keyboardHeight.height.value}");
    final appBarBg = widget.title.contains("Emergency") ? Colors.red : context.backgroundColor;
    final appBarIconBg = widget.title.contains("Emergency") ? Colors.white : Colors.black45;
    return Material(
      child: Scaffold(
        appBar: _appBar(appBarIconBg, appBarBg),
        body: Container(
          color: context.appColors.defaultBackground,
          child: Column(
            children: [
              // chat list 영역
              Expanded(
                // child: Container(),
                child: Obx(
                  () => ListView.builder(
                    itemBuilder: (context, index) {
                      final message = messageData.msgList[index];
                      return MessageItem(message);
                    },
                    itemCount: messageData.msgList.length,
                  ).pOnly(top: 10),
                ),
              ),
              // text 입력 영역
              Container(
                color: Colors.yellow,
                child: Row(
                  children: [
                    Icon(Icons.chat),
                    Icon(Icons.location_on),
                    Icon(Icons.file_copy),
                    Expanded(child: TextField()),
                    Container(
                      decoration: BoxDecoration(color: Colors.green),
                      child: "send".text.make(),
                    )
                  ],
                ),
              ),
              // ppt 영역
              Container(
                color: Colors.grey,
                height: keyboardHeight.height.value, // 높이 조정이 필요해보임.,
                child: Column(
                  children: [
                    "Tab the PTT button to speak".text.make(),
                    PttButton(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.video_camera_back_rounded),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.speaker),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(Color appBarIconBg, Color appBarBg) {
    return AppBar(
      iconTheme: IconThemeData(color: appBarIconBg),
      backgroundColor: appBarBg,
      title: Row(
        children: [
          Flexible(
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          WidthBox(2),
          Text(widget.memberCount),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emergency,
              color: widget.title.contains("Emergency") ? Colors.white : Colors.red,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
            )),
      ],
    );
  }
}
