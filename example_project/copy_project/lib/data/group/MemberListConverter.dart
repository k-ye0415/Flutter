import 'dart:convert';

import 'package:copy_project/data/group/group_member/GroupMember.dart';
import 'package:json_annotation/json_annotation.dart';

class MemberListConverter implements JsonConverter<List<GroupMember>, String> {
  const MemberListConverter();

  @override
  List<GroupMember> fromJson(String json) {
    List<dynamic> jsonList = jsonDecode(json);
    return jsonList.map((json) => GroupMember.fromJson(json)).toList();
  }

  @override
  String toJson(List<GroupMember> object) {
    List<Map<String, dynamic>> jsonList = object.map((m) => m.toJson()).toList();
    return jsonEncode(jsonList);
  }
}
