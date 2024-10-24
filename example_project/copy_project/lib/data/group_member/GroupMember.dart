class GroupMember {
  final String displayName;
  final Presence presence;

  GroupMember(this.displayName, this.presence);
}

enum Presence {
  online(), dnd(), offline();
}