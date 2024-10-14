import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/settings/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/settings/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/settings/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';

import '../../../../../common/data/preference/prefs.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final scrollerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 150),
            controller: scrollerController,
            children: [
              // swtich
              Obx(
                () => SwitchMenu(
                  "푸시 설정",
                  Prefs.isPushOnRx.get(),
                  onChanged: (isOn) {
                    Prefs.isPushOnRx.set(isOn);
                  },
                ),
              ),
              // slider
              Obx(
                () => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    Prefs.sliderPosition.set(value);
                  },
                ),
              ),
              // date time
              Obx(
                () => BigButton(
                  "날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}",
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(100.days),
                        lastDate: DateTime.now().add(100.days));
                    if (date != null) {
                      Prefs.birthday.set(date);
                    }
                  },
                ),
              ),
              // number dialog
              Obx(
                () => BigButton(
                  "저장된 숫자 ${Prefs.number.get()}",
                  onTap: () async {
                    final number = await NumberDialog().show();
                    if (number != null) {
                      Prefs.number.set(number);
                    }
                  },
                ),
              ),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton("오픈소스 화면", onTap: () async {
                Nav.push(OpensourceScreen());
              }),
            ],
          ),
          AnimatedAppBar("설정", controller:scrollerController),
        ],
      ),
    );
  }
}
