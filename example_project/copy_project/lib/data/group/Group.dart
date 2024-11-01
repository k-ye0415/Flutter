import 'dart:convert';

import 'package:copy_project/data/group/MemberListConverter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'group_member/GroupMember.dart';

part 'Group.g.dart';

@JsonSerializable()
class Group {
  final GroupPriority priority;
  final String groupIcon;
  final String groupName;
  final String groupDescription;
  @MemberListConverter()
  final List<GroupMember> memberList;

  Group(this.priority, this.groupIcon, this.groupName, this.groupDescription, this.memberList);

  Map<String, dynamic> toMap() {
    return {
      "priority": priority.name,
      "groupIcon": groupIcon,
      "groupName": groupName,
      "groupDescription": groupDescription,
      "memberList": memberList.map((map) => map.toJson()).toList(),
    };
  }

  Map<String, dynamic> toJson() {
    return _$GroupToJson(this);
  }

  factory Group.fromJson(Map<String, dynamic> json) {
    return _$GroupFromJson(json);
  }

// factory Group.fromMap(Map<String, dynamic> map) {
//   print("Group.fromMap : ");
//   // print("Group.fromMap : ${map['memberList']}");
//   // final dream = map["memberList"] as String;
//   // print("string cast : $dream");
//   // final listCast = json.decode(dream);
//   // print("listCast cast : $listCast");
//   // // final List<dynamic> string = json.decode(map["memberList"] as String);
//   // // final test = (map["memberList"] as List);
//   // // final test2 = string.cast<Map<String, dynamic>>();
//   // // for (final i in test2) {
//   // //   final testest = GroupMember.fromMap(i);
//   // // print("testest : ${testest}");
//   // // }
//   // return Group(
//   //   map["priority"] == "normal" ? GroupPriority.normal : GroupPriority.special,
//   //   map["groupIcon"],
//   //   map["groupName"],
//   //   map["groupDescription"],
//   //   (map["memberList"] as List).map((item) => GroupMember.fromMap(item)).toList(),
//   // );
//   return Group(
//     map["priority"] as GroupPriority,
//     map["groupIcon"] as String,
//     map["groupName"] as String,
//     map["groupDescription"] as String,
//     map["memberList"] as List<GroupMember>,
//   );
// }
}

enum GroupPriority { special(), normal() }
