import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class CommonProvider {
  late final keyboardHeight = Get.find<KeyboardHeight>();
}

class KeyboardHeight extends GetxController {
  RxDouble height = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }


}