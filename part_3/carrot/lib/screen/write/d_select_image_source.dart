import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSourceDialog extends DialogWidget<ImageSource> {
  SelectImageSourceDialog({super.key});

  @override
  DialogState<SelectImageSourceDialog> createState() => _SelectImageSourceDialogState();
}

class _SelectImageSourceDialogState extends DialogState<SelectImageSourceDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
              color: context.backgroundColor, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tap(
                onTap: () {
                  widget.hide(ImageSource.camera);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    "카메라".text.make(),
                  ],
                ).p(30),
              ),
              Line().pSymmetric(h: 20),
              Tap(
                onTap: () {
                  widget.hide(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_outlined),
                    "갤러리".text.make(),
                  ],
                ).p(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
