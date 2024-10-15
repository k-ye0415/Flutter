import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo/vo_todo.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_fire.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        debugPrint("tap :::: ${todo.status}");
        context.holder.changeTodoStatus(todo);
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: switch (todo.status) {
          TodoStatus.complete => Checkbox(
              value: true,
              onChanged: null,
              fillColor: MaterialStateProperty.all(context.appColors.checkboxColor),
            ),
          TodoStatus.incomplete => Checkbox(
              value: false,
              onChanged: null,
            ),
          TodoStatus.ongoing => Fire(),
        },
      ),
    );
  }
}
