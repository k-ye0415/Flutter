enum SettingType {
  DND(),
  ScanList(),
  ZoneGroup(),
  CovertMode(),
  FocusMode();

  const SettingType();
}


class Setting {
  final SettingType type;
  bool isUsed;

  Setting(this.type, this.isUsed);
}
