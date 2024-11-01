// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GroupMember.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      json['displayName'] as String,
      $enumDecode(_$PresenceEnumMap, json['presence']),
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'presence': _$PresenceEnumMap[instance.presence]!,
    };

const _$PresenceEnumMap = {
  Presence.online: 'online',
  Presence.dnd: 'dnd',
  Presence.offline: 'offline',
};
