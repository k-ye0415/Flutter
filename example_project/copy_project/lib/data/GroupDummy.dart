import 'package:copy_project/common.dart';
import 'package:copy_project/data/group/Group.dart';
import 'package:copy_project/data/group_member/GroupMember.dart';

final emergencyGroup = Group(
  GroupPriority.special,
  "$baseIconPath/ic_emergency.svg",
  "Emergency Group",
  "EmergencyGroup (Agency default)",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
    GroupMember("user7", Presence.online),
    GroupMember("user8", Presence.online),
    GroupMember("user9", Presence.online),
    GroupMember("user10", Presence.online),
    GroupMember("user11", Presence.online),
    GroupMember("user12", Presence.online),
  ],
);

final homeGroup = Group(
  GroupPriority.special,
  "$baseIconPath/ic_home.svg",
  "Home Group",
  "HomeGroup (Agency default)",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
    GroupMember("user7", Presence.online),
    GroupMember("user8", Presence.online),
    GroupMember("user9", Presence.online),
    GroupMember("user10", Presence.online),
    GroupMember("user11", Presence.online),
    GroupMember("user12", Presence.online),
  ],
);

final normalGroup1 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "Group1",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
  ],
);

final normalGroup2 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "Group2",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
    GroupMember("user7", Presence.online),
    GroupMember("user8", Presence.online),
    GroupMember("user9", Presence.online),
    GroupMember("user10", Presence.online),
  ],
);

final normalGroup3 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "How Far i'll Go",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user6", Presence.online),
  ],
);

final normalGroup4 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "This is me",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
    GroupMember("user7", Presence.online),
    GroupMember("user8", Presence.online),
    GroupMember("user9", Presence.online),
    GroupMember("user10", Presence.online),
  ],
);

final normalGroup5 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "Let it Go",
  "Pre-arranged Group",
  [
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
  ],
);

final normalGroup6 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "I see the light",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
    GroupMember("user7", Presence.online),
    GroupMember("user8", Presence.online),
    GroupMember("user9", Presence.online),
    GroupMember("user10", Presence.online),
  ],
);

final normalGroup7 = Group(
  GroupPriority.normal,
  "$baseIconPath/ic_pre_group.svg",
  "A whole new world",
  "Pre-arranged Group",
  [
    GroupMember("user1", Presence.online),
    GroupMember("user2", Presence.online),
    GroupMember("user3", Presence.online),
    GroupMember("user4", Presence.online),
    GroupMember("user5", Presence.online),
    GroupMember("user6", Presence.online),
  ],
);

final groupList = [
  emergencyGroup,
  homeGroup,
  normalGroup1,
  normalGroup2,
  normalGroup3,
  normalGroup4,
  normalGroup5,
  normalGroup6,
  normalGroup7,
];
