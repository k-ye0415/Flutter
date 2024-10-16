import 'package:fast_app_base/common/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/common/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo/vo_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../screen/dialog/d_confirm.dart';
import '../../../../screen/main/write/d_write_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

  void changeTodoStatus(Todo todo) async {
    debugPrint("todo : ${todo.status}");
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말로 처음 상태로 변경하시겟슴까?").show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }
    todoList.refresh();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      todoList.add(Todo(
          id: DateTime
              .now()
              .millisecondsSinceEpoch, title: result.title, dueDate: result.date));
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.title;
      todo.dueDate = result.date;
      todoList.refresh();
    }
  }

  void remove(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}


// class TodoDataHolder extends InheritedWidget {
//   final TodoDataNotifier notifier;
//
//   const TodoDataHolder({
//     super.key,
//     required super.child,
//     required this.notifier,
//   });
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
//
//   static TodoDataHolder _of(BuildContext context) {
//     TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
//     return inherited;
//   }
//
//   void changeTodoStatus(Todo todo) async {
//     debugPrint("todo : ${todo.status}");
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog("정말로 처음 상태로 변경하시겟슴까?").show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//     }
//     notifier.notify();
//   }
//
//   void addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       notifier.add(Todo(
//           id: DateTime
//               .now()
//               .millisecondsSinceEpoch, title: result.title, dueDate: result.date));
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       todo.title = result.title;
//       todo.dueDate = result.date;
//       notifier.notify();
//     }
//   }
//
//   void remove(Todo todo) {
//     notifier.value.remove(todo);
//     notifier.notify();
//   }
// }
//
// extension TodoDataHolderContextExtension on BuildContext {
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }
