import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'MainScreen.dart';

class ConversationScreen extends StatefulWidget {
  final String? title;
  const ConversationScreen({super.key, this.title});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: widget.title?.text.make() ?? Text("data"),
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
