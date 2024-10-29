import 'package:copy_project/data/message/Message.dart';
import 'package:get/get.dart';

import 'MessageDummy.dart';

abstract mixin class MessageDataProvider {
  late final messageData = Get.find<MessageData>();
}

class MessageData extends GetxController {
  List<Message> msgList = <Message>[].obs;

  @override
  void onInit() {
    final dummyList = [
      message1,
      message2,
      message3,
      message4,
      message5,
      message6,
      message7,
      message8,
      message9,
      message10,
      message11,
      message12,
      message13,
      message14,
      message15,
      message16,
    ];
    dummyList.sort((a, b) => a.sendTime.compareTo(b.sendTime));
    msgList.addAll(dummyList);
    super.onInit();
  }
}
