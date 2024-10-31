class Message {
  final int id;
  final String displayName;
  final String message;
  final Direction direction;
  final DateTime sendTime;
  final MessageType messageType;
  final MediaType? mediaType;

  Message(
    this.id,
    this.displayName,
    this.message,
    this.direction,
    this.sendTime,
    this.messageType,
    this.mediaType,
  );
}

enum Direction {
  incoming(1),
  outgoing(2);

  const Direction(this.direction);

  final int direction;
}

enum MessageType {
  emergencyAlert(1),
  normal(2),
  file(3),
  call(4),
  alertClear(5);

  const MessageType(this.type);

  final int type;
}

enum MediaType {
  voice,
  video;

  const MediaType();
}
