import 'package:json_annotation/json_annotation.dart';

part 'GroupMember.g.dart';

@JsonSerializable()
class GroupMember {
  final String displayName;
  final Presence presence;

  GroupMember(this.displayName, this.presence);

  Map<String, dynamic> toJson(){
    return _$GroupMemberToJson(this);
  }

  factory GroupMember.fromJson(Map<String, dynamic> json) {
    return _$GroupMemberFromJson(json);
  }
}

enum Presence {
  online(),
  dnd(),
  offline();
}
