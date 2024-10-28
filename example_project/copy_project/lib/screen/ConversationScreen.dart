import 'package:copy_project/common/CommonProvider.dart';
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

class _ConversationScreenState extends State<ConversationScreen> with CommonProvider {

  @override
  void initState() {
    Get.put(KeyboardHeight());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Flexible(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(widget.memberCount),
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.emergency,
                  color: Colors.red,
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
        ),
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              // chat list 영역
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: SingleChildScrollView(
                    child: "Text".text.make(),
                  ),
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
                height: keyboardHeight.height.value + 60 + 30, // 높이 조정이 필요해보임.,
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
}
