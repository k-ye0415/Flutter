import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  final User user;
  final Address address;

  const UserProfileWidget(this.user, {super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.profileUrl,
            width: 60,
          ),
        ),
        width20,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user.nickname.text.bold.make(),
              height10,
              address.simpleAddress.text.make(),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    user.temperature.text.color(getColor(user.temperature)).bold.make(),
                    SizedBox(
                        width: 60,
                        child: LinearProgressIndicator(
                          value: 0.3,
                          color: Colors.green,
                        ))
                  ],
                ),
                Icon(
                  Icons.smart_toy,
                  size: 30,
                ),
              ],
            ),
            "매너온도".text.color(context.appColors.lessImportant).underline.make(),
          ],
        )
      ],
    ).p(15);
  }

  Color getColor(double temp) {
    if (temp >= 0 && temp <= 30) {
      return Colors.blue;
    } else if (temp >= 31 && temp <= 40) {
      return Colors.green;
    } else if (temp >= 41) {
      // 100보다 크거나 같을 필요는 없음
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
