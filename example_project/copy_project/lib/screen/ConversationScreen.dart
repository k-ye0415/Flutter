import 'dart:io';

import 'package:camera/camera.dart';
import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:copy_project/data/message/Message.dart';
import 'package:copy_project/data/message/MessageDataProvider.dart';
import 'package:copy_project/widget/TabWidget.dart';
import 'package:copy_project/widget/item/MessageItem.dart';
import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/message/MessageDummy.dart';
import '../main.dart';
import '../widget/PttButton.dart';
import '../widget/ui_widget/CircleLine.dart';
import 'MainScreen.dart';

class ConversationScreen extends StatefulWidget {
  final String title;
  final String memberCount;
  final bool isEmergencyAlert;

  const ConversationScreen({
    super.key,
    required this.title,
    required this.memberCount,
    this.isEmergencyAlert = false,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with CommonProvider, MessageDataProvider {
  final inputTextController = TextEditingController();
  final scrollController = ScrollController();
  bool isFileMode = false;
  bool isVideoMode = false;
  final ImagePicker picker = ImagePicker();
  XFile? _image;
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    Get.put(KeyboardHeight());
    Get.put(MessageData());

    inputTextController.addListener(() {
      setState(() {});
    });
    super.initState();
    _initializeCamera();
    if (widget.isEmergencyAlert) {
      messageData.msgList.add(Message(
        getRandomId(),
        "Me",
        "Emergency Alert",
        Direction.outgoing,
        DateTime.now(),
        MessageType.emergencyAlert,
        null,
      ));
    }
  }

  Future<void> _initializeCamera() async {
    _cameraController = CameraController(
      cameras[0], // Select the desired camera (e.g., front or back)
      ResolutionPreset.high,
    );
    await _cameraController.initialize();
    setState(() => _isCameraInitialized = true);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarBg =
        widget.title.contains("Emergency") ? Colors.red : context.appColors.appbarBackground;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final scale = _isCameraInitialized
        ? 1 / (_cameraController.value.aspectRatio * MediaQuery.of(context).size.aspectRatio)
        : 1.0;
    return Material(
      child: Scaffold(
        appBar: _appBar(Colors.white, appBarBg),
        body: Stack(
          children: [
            isVideoMode
                ? Stack(
                    children: [
                      // camera 넣기
                      Container(
                        color: Colors.green,
                        child: _isCameraInitialized
                            ? Transform.scale(scale: scale, child: CameraPreview(_cameraController))
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _pttArea(context, isKeyboardVisible),
                      ),
                    ],
                  )
                : Container(
                    color: context.appColors.defaultBackground,
                    child: Column(
                      children: [
                        // chat list 영역
                        _chatListArea(),
                        // file attach 영역
                        _image != null ? _fileAttachLayout() : goneWidget,
                        // text 입력 영역
                        _inputArea(context),
                        // ppt 영역
                        _pttArea(context, isKeyboardVisible)
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

// widgets
  AnimatedContainer _pttArea(BuildContext context, bool isKeyboardVisible) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      color: isVideoMode ? Colors.transparent : context.appColors.pttAreaBackground,
      height: isKeyboardVisible ? 0 : keyboardHeight.height.value,
      child: Stack(
        children: [
          isFileMode ? _fileLayout() : _pttLayout(context),
        ],
      ),
    );
  }

  Container _fileLayout() {
    return Container(
      color: Color(0xFF161719),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Tap(
                  onTap: () {
                    getImage(ImageSource.gallery);
                  },
                  child: _iconWithLabel(Colors.green, Icons.image, "Photo"),
                ),
                Tap(
                  onTap: () {
                    getImage(ImageSource.camera);
                  },
                  child: _iconWithLabel(Colors.redAccent, Icons.camera_alt_outlined, "Camera")
                      .pOnly(top: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: _iconWithLabel(Colors.purple, Icons.video_camera_back_outlined, "Video"),
          ),
          Expanded(
            child: _iconWithLabel(Colors.blue, Icons.audiotrack_outlined, "Audio"),
          ),
          Expanded(
            child: _iconWithLabel(Colors.orange, Icons.folder_copy, "Folder"),
          ),
        ],
      ).pOnly(top: 18),
    );
  }

  Widget _iconWithLabel(Color color, IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
          child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        label.text.size(12).color(Colors.white).make().pOnly(top: 8),
      ],
    );
  }

  Column _pttLayout(BuildContext context) {
    return Column(
      children: [
        "Tab the PTT button to speak"
            .text
            .color(context.appColors.normalText)
            .size(12)
            .make()
            .pOnly(top: 18, bottom: 40),
        PttButton(isVideoMode: isVideoMode),
        Row(
          children: [
            CircleLine(
              borderColor: Color(0xFF4F4F4F),
              borderSize: 1.0,
              foregroundColor: Color(0xFF202020),
              radius: 40.0,
              child: IconButton(
                onPressed: () {
                  // video mode
                  setState(() {
                    isVideoMode = !isVideoMode;
                    print("isVideoMode : $isVideoMode");
                  });
                  // Nav.push(CameraScreen());
                },
                icon: Icon(isVideoMode ? Icons.call : Icons.video_camera_back_rounded),
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
    );
  }

  Container _fileAttachLayout() {
    return Container(
      height: 96,
      color: Color(0xFF202020),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 55,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Image.file(
                File(_image!.path),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                "20%".text.color(Colors.white).make()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _inputArea(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // 키보드?
            },
            icon: Icon(
              Icons.chat,
              color: Colors.white,
              size: 20,
            ),
            highlightColor: context.appColors.defaultRipple,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // file attach layout
              setState(() {
                isFileMode = !isFileMode;
              });
            },
            icon: Icon(
              isFileMode ? Icons.close : Icons.file_copy,
              color: Colors.white,
              size: 20,
            ),
            highlightColor: context.appColors.defaultRipple,
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "(${inputTextController.text.length}/1012)",
                      style: TextStyle(color: Color(0xFFb2b2b2), fontSize: 9, height: -1),
                    ),
                  ),
                  TextField(
                    controller: inputTextController,
                    cursorColor: context.appColors.pointColor,
                    cursorWidth: 1,
                    cursorHeight: 18,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Input message",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8e8e8e),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tap(
            onTap: () {
              // message insert
              messageData.msgList.add(Message(
                getRandomId(),
                "Me",
                inputTextController.text,
                Direction.outgoing,
                DateTime.now(),
                MessageType.normal,
                null,
              ));
              inputTextController.clear();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 11, bottom: 11, left: 16),
              width: 46,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: inputTextController.text.isNotEmpty
                      ? context.appColors.pointColor
                      : Colors.grey),
              child: Center(
                child: "SEND".text.size(12).white.make(),
              ),
            ).pOnly(right: 20),
          ),
        ],
      ),
    );
  }

  Expanded _chatListArea() {
    return Expanded(
      // child: Container(),
      child: Obx(() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          }
        });
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            final message = messageData.msgList[index];
            return MessageItem(
              message,
              onUpdateMessage: _updateMessageInList,
            );
          },
          itemCount: messageData.msgList.length,
        ).pOnly(top: 10);
      }),
    );
  }

  void _updateMessageInList(Message updatedMessage) {
    final index = messageData.msgList.indexWhere((msg) => msg.id == updatedMessage.id);
    if (index != -1) {
      messageData.msgList[index] = updatedMessage;
      messageData.msgList.refresh();
    }
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
