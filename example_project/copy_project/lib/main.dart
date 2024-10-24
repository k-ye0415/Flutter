import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await AppPreferences.init();
  runApp(const GetMaterialApp(home: App()));
}
