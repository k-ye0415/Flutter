import 'package:copy_project/common/database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await AppPreferences.init();
  // await DatabaseHelper.instance.database;
  runApp(const GetMaterialApp(home: App()));
}
