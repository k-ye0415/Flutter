import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/data/message/MessageDataProvider.dart';
import 'package:copy_project/widget/EditTextWidget.dart';
import 'package:copy_project/widget/item/MessageItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/PttButton.dart';
import '../widget/ui_widget/CircleLine.dart';
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
  final inputTextController = TextEditingController();

  @override
  void initState() {
    Get.put(KeyboardHeight());
    Get.put(MessageData());

    inputTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ConversationView height : ${keyboardHeight.height.value}");
    final appBarBg =
        widget.title.contains("Emergency") ? Colors.red : context.appColors.appbarBackground;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Material(
      child: Scaffold(
        appBar: _appBar(Colors.white, appBarBg),
        body: Container(
          color: context.appColors.defaultBackground,
          child: Column(
            children: [
              // chat list 영역
              _chatListArea(),
              // text 입력 영역
              _inputArea(context),
              // ppt 영역
              _pttArea(context, isKeyboardVisible)
              // Container(
              //   color: context.appColors.pttAreaBackground,
              //   height: keyboardHeight.height.value, // 높이 조정이 필요해보임.,
              //   child: Column(
              //     children: [
              //       "Tab the PTT button to speak"
              //           .text
              //           .color(context.appColors.normalText)
              //           .size(12)
              //           .make()
              //           .pOnly(top: 18, bottom: 40),
              //       PttButton(),
              //       Row(
              //         children: [
              //           CircleLine(
              //             borderColor: Color(0xFF4F4F4F),
              //             borderSize: 1.0,
              //             foregroundColor: Color(0xFF202020),
              //             radius: 40.0,
              //             child: IconButton(
              //               onPressed: () {},
              //               icon: Icon(Icons.video_camera_back_rounded),
              //               highlightColor: context.appColors.defaultRipple,
              //             ),
              //           ).pOnly(left: 50),
              //           Spacer(),
              //           CircleLine(
              //             borderColor: Color(0xFF4F4F4F),
              //             borderSize: 1.0,
              //             foregroundColor: Color(0xFF202020),
              //             radius: 40.0,
              //             child: IconButton(
              //               onPressed: () {},
              //               icon: Icon(Icons.speaker),
              //               highlightColor: context.appColors.defaultRipple,
              //             ),
              //           ).pOnly(right: 50),
              //         ],
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer _pttArea(BuildContext context, bool isKeyboardVisible) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      color: context.appColors.pttAreaBackground,
      height: isKeyboardVisible ? 0 : keyboardHeight.height.value,
      child: Column(
        children: [
          "Tab the PTT button to speak"
              .text
              .color(context.appColors.normalText)
              .size(12)
              .make()
              .pOnly(top: 18, bottom: 40),
          PttButton(),
          Row(
            children: [
              CircleLine(
                borderColor: Color(0xFF4F4F4F),
                borderSize: 1.0,
                foregroundColor: Color(0xFF202020),
                radius: 40.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.video_camera_back_rounded),
                  highlightColor: context.appColors.defaultRipple,
                ),
              ).pOnly(left: 50),
              Spacer(),
              CircleLine(
                borderColor: Color(0xFF4F4F4F),
                borderSize: 1.0,
                foregroundColor: Color(0xFF202020),
                radius: 40.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.speaker),
                  highlightColor: context.appColors.defaultRipple,
                ),
              ).pOnly(right: 50),
            ],
          )
        ],
      ),
    );
  }

  Container _inputArea(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.chat,
              color: Colors.white,
              size: 20,
            ),
            highlightColor: context.appColors.defaultRipple,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
            highlightColor: context.appColors.defaultRipple,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.file_copy,
              color: Colors.white,
              size: 20,
            ),
            highlightColor: context.appColors.defaultRipple,
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: "(0/1012)".text.color(Color(0xFFb2b2b2)).size(9).make(),
                  ),
                  TextField(
                    cursorColor: context.appColors.pointColor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: "Input message",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8e8e8e),
                        )),
                  ),
                ],
              ),
            ),
            // child: EditTextWidget(inputTextController,
            //     hint: "Input message", context: context),
          ),
          Container(
            margin: EdgeInsets.only(top: 11, bottom: 11, left: 16),
            width: 46,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: Center(
              child: "SEND".text.bold.white.make(),
            ),
          ).pOnly(right: 20),
        ],
      ),
    );
  }

  Expanded _chatListArea() {
    return Expanded(
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
    );
  }

  AppBar _appBar(Color appBarIconBg, Color appBarBg) {
    return AppBar(
      iconTheme: IconThemeData(color: appBarIconBg),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
