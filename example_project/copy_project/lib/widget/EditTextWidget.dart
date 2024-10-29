import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTextWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const EditTextWidget(this.controller, {super.key, required this.hint});

  @override
  State<EditTextWidget> createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.appColors.pointColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.appColors.editTextBorder),
          ),
        ),
      ),
    );
  }
}
