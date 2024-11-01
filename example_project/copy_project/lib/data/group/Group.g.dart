// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      $enumDecode(_$GroupPriorityEnumMap, json['priority']),
      json['groupIcon'] as String,
      json['groupName'] as String,
      json['groupDescription'] as String,
      const MemberListConverter().fromJson(json['memberList'] as String),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'priority': _$GroupPriorityEnumMap[instance.priority]!,
      'groupIcon': instance.groupIcon,
      'groupName': instance.groupName,
      'groupDescription': instance.groupDescription,
      'memberList': const MemberListConverter().toJson(instance.memberList),
    };

const _$GroupPriorityEnumMap = {
  GroupPriority.special: 'special',
  GroupPriority.normal: 'normal',
};
