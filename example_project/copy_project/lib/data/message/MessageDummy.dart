import 'dart:math';

import 'package:copy_project/data/message/Message.dart';

final message1 = Message(
  "Another User",
  "message",
  Direction.incomming,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message2 = Message(
  "Me",
  "Emergency Alert",
  Direction.outgoing,
  getRandomTime(),
  MessageType.emergencyAlert,
  null,
);
final message3 = Message(
  "Me",
  "10:40",
  Direction.outgoing,
  getRandomTime(),
  MessageType.call,
  MediaType.voice,
);
final message4 = Message(
  "Another User",
  "10:40",
  Direction.incomming,
  getRandomTime(),
  MessageType.call,
  MediaType.video,
);
final message5 = Message(
  "Another User",
  "message",
  Direction.incomming,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message6 = Message(
  "Me",
  "We Belong Together",
  Direction.outgoing,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message7 = Message(
  "Me",
  "10:40",
  Direction.outgoing,
  getRandomTime(),
  MessageType.call,
  MediaType.voice,
);
final message8 = Message(
  "Another User",
  "10:40",
  Direction.incomming,
  getRandomTime(),
  MessageType.call,
  MediaType.video,
);
final message9 = Message(
  "Another User",
  "message",
  Direction.incomming,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message10 = Message(
  "Another User",
  "Emergency Alert",
  Direction.incomming,
  getRandomTime(),
  MessageType.emergencyAlert,
  null,
);
final message11 = Message(
  "Me",
  "10:40",
  Direction.outgoing,
  getRandomTime(),
  MessageType.call,
  MediaType.voice,
);
final message12 = Message(
  "Another User",
  "10:40",
  Direction.incomming,
  getRandomTime(),
  MessageType.call,
  MediaType.video,
);
final message13 = Message(
  "Another User",
  "message",
  Direction.incomming,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message14 = Message(
  "Me",
  "you've Got a Friend in Me",
  Direction.outgoing,
  getRandomTime(),
  MessageType.normal,
  null,
);
final message15 = Message(
  "Me",
  "10:40",
  Direction.outgoing,
  getRandomTime(),
  MessageType.call,
  MediaType.voice,
);
final message16 = Message(
  "Another User",
  "10:40",
  Direction.incomming,
  getRandomTime(),
  MessageType.call,
  MediaType.video,
);

DateTime getRandomTime() {
  final random = Random();

  // Define the start and end times
  const startHour = 10; // 10 AM
  const endHour = 19; // 7 PM

  // Generate a random hour between 10 and 19
  int randomHour = startHour + random.nextInt(endHour - startHour + 1);

  // Generate a random minute between 0 and 59
  int randomMinute = random.nextInt(60);

  // Construct DateTime with today's date and the random time
  DateTime randomTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    randomHour,
    randomMinute,
  );

  return randomTime;
}
