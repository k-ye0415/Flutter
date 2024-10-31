import 'package:camera/camera.dart';
import 'package:copy_project/common/database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'App.dart';

late List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await AppPreferences.init();
  // await DatabaseHelper.instance.database;
  cameras = await availableCameras();
  runApp(const GetMaterialApp(home: App()));
}
