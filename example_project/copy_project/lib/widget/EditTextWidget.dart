import 'package:copy_project/common/CommonProvider.dart';
import 'package:copy_project/common/extension/ContextExtension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTextWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final BuildContext mContext;

  const EditTextWidget(this.controller, {super.key, required this.hint, required this.mContext});

  @override
  State<EditTextWidget> createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> with CommonProvider {
  final _focusNode = FocusNode();

  @override
  void initState() {
    Get.put(KeyboardHeight());
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
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

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          keyboardHeight.height.value = MediaQuery.of(widget.mContext).viewInsets.bottom;
          debugPrint(
              "keyboardHeight.keyboardHeight.value : ${keyboardHeight.height.value}\n MediaQuery.of(context).viewInsets.bottom : ${MediaQuery.of(context).viewInsets.bottom}");
        });
      });
    }
  }
}