import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      actions: actions,
    );
    //   AppBar(
    //   title: title.text.make(),
    //   actions: [
    //     IconButton(
    //         onPressed: () {},
    //         icon: Icon(
    //           Icons.emergency,
    //           color: Colors.red,
    //         )),
    //     IconButton(
    //         onPressed: () {},
    //         icon: Icon(
    //           Icons.search,
    //         )),
    //     IconButton(
    //         onPressed: () {},
    //         icon: Icon(
    //           Icons.add,
    //         )),
    //   ],
    // );
  }
}
