import 'dart:convert';

import 'package:copy_project/common/database/DatabaseHelper.dart';
import 'package:copy_project/data/group/Group.dart';
import 'package:flutter/material.dart';

import '../../data/group/group_member/GroupMember.dart';

class GroupViewModel extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Group> _groups = [];

  List<Group> get groupList => _groups;

  Future<void> loadGroups() async {
    _groups = await _dbHelper.getGroups();
    notifyListeners();
  }

  Future<void> insertGroupFromJson(String json) async {
    final parsedGroups = parseGroupsFromJson(json);
    final groupList = await _dbHelper.getGroups();
    if (groupList.isEmpty) {
      for (final group in parsedGroups) {
        print("insertGroupFromJson");
        await _dbHelper.insertGroup(group);
      }
    } else {
      print("loadGroups");
      // await loadGroups();
      notifyListeners();
    }
  }

  // Parse JSON to List<Group>
  List<Group> parseGroupsFromJson(String jsonData) {
    final data = json.decode(jsonData) as Map<String, dynamic>;
    return (data['groups'] as List).map((map) {
      return Group(
        map["priority"] == "normal" ? GroupPriority.normal : GroupPriority.special,
        map["groupIcon"],
        map["groupName"],
        map["groupDescription"],
        (map['memberList'] as List? ?? []).map((memberData) {
          return GroupMember(
            memberData['displayName'],
            memberData['presence'] == "online" ? Presence.online : Presence.offline,
          );
        }).toList(),
      );
    }).toList();
  }
}
