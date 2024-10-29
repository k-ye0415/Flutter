
import 'group_member/GroupMember.dart';

class Group {
  final GroupPriority priority;
  final String groupIcon;
  final String groupName;
  final String groupDescription;
  final List<GroupMember> memberList;

  Group(this.priority, this.groupIcon, this.groupName, this.groupDescription, this.memberList);
}

enum GroupPriority { special(), normal() }
