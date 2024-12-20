import 'dart:io';
import 'dart:math';

import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/screen/main/post_detail/s_post_detail.dart';
import 'package:fast_app_base/screen/main/tab/home/provider/post_provider.dart';
import 'package:fast_app_base/screen/write/d_select_image_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../entity/user/vo_address.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> with KeyboardDetector {
  final List<String> imageList = [];
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isLoading = false;

  bool get isValid =>
      isNotBlank(titleController.text) &&
      isNotBlank(priceController.text) &&
      isNotBlank(descriptionController.text);

  @override
  void initState() {
    titleController.addListener(() {
      setState(() {});
    });

    priceController.addListener(() {
      setState(() {});
    });

    descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final address = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: "내 물건 팔기".text.bold.make(),
        centerTitle: false,
        actions: ["임시저장".text.make().p(15)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageSelectedWidget(
              imageList,
              onTapDeletedImage: (imagePath) {
                setState(() {
                  imageList.remove(imagePath);
                });
              },
              onTap: () async {
                final selectedSource = await SelectImageSourceDialog().show();
                if (selectedSource == null) {
                  return;
                }
                final file = await ImagePicker().pickImage(source: selectedSource);
                if (file == null) {
                  return;
                }
                setState(() {
                  imageList.add(file.path);
                });
              },
            ),
            _TitleEditor(titleController),
            height30,
            _PriceEditor(priceController),
            height30,
            _DescEditor(descriptionController, address.first.address),
          ],
        ).pSymmetric(h: 15),
      ),
      bottomSheet: isKeyboardOn
          ? null
          : RoundButton(
              text: isLoading ? "저장 중" : "작성 완료",
              isEnabled: isValid,
              rightWidget: isLoading
                  ? SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    ).pOnly(right: 40)
                  : null,
              onTap: () {
                print(isLoading);
                final title = titleController.text;
                final price = int.parse(priceController.text);
                final description = descriptionController.text;
                setState(() {
                  isLoading = true;
                  print(isLoading);
                });
                final list = ref.read(postProvider);
                final newPost = SimpleProductPost(
                    6,
                    user3,
                    Product(
                      user3,
                      title,
                      price,
                      ProductStatus.normal,
                      imageList,
                    ),
                    title,
                    Address("졸려..", "집 가고 싶다.."),
                    0,
                    0,
                    DateTime.now());
                ref.read(postProvider.notifier).state = List.of(list)..add(newPost);
                Nav.pop(context);
                Nav.push(PostDetailScreen(
                  newPost.id,
                  simpleProductPost: newPost,
                ));
              },
              isFullWidth: true,
              borderRadius: 6,
            ),
    );
  }
}

class _ImageSelectedWidget extends StatelessWidget {
  final List<String> imageList;
  final VoidCallback onTap;
  final void Function(String path) onTapDeletedImage;

  _ImageSelectedWidget(
    this.imageList, {
    super.key,
    required this.onTap,
    required this.onTapDeletedImage,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SelectImageButton(onTap: onTap, imageList: imageList).pOnly(right: 8, top: 10),
            ...imageList.map(
              (e) => Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(e),
                        fit: BoxFit.fill,
                      ).box.rounded.border(color: Colors.grey).make(),
                    ),
                  ).pOnly(left: 4, right: 10, top: 10),
                  Tap(
                    onTap: () {
                      onTapDeletedImage(e);
                    },
                    child: Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Icon(Icons.add_circle),
                        ).pOnly(left: 30, bottom: 30),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class _ImageSelectedWidget extends StatefulWidget {
//   final List<String> imageList;
//   final VoidCallback onTap;
//
//   _ImageSelectedWidget(this.imageList, {super.key, required this.onTap});
//
//   @override
//   State<_ImageSelectedWidget> createState() => _ImageSelectedWidgetState();
// }
//
// class _ImageSelectedWidgetState extends State<_ImageSelectedWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SizedBox(
//       height: 100,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             SelectImageButton(onTap: widget.onTap, imageList: widget.imageList)
//                 .pOnly(right: 8, top: 10),
//             ...widget.imageList.map(
//                   (e) => Stack(
//                 children: [
//                   SizedBox(
//                     width: 80,
//                     height: 80,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Image.file(
//                         File(e),
//                         fit: BoxFit.fill,
//                       ).box.rounded.border(color: Colors.grey).make(),
//                     ),
//                   ).pOnly(left: 4, right: 10, top: 10),
//                   Tap(
//                     onTap: () {
//                       // 이미지 삭제
//                       setState(() {
//                         widget.imageList.remove(e);
//                       });
//                     },
//                     child: Positioned.fill(
//                       child: Align(
//                         alignment: Alignment.topRight,
//                         child: Transform.rotate(
//                           angle: pi / 4,
//                           child: Icon(Icons.add_circle),
//                         ).pOnly(left: 30, bottom: 30),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    super.key,
    required this.onTap,
    required this.imageList,
  });

  final VoidCallback onTap;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: imageList.length.toString(), style: TextStyle(color: Colors.orange)),
              TextSpan(text: "/10"),
            ]))
          ],
        ).box.rounded.border(color: Colors.grey).make(),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  final TextEditingController controller;

  _TitleEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "제목".text.bold.make(),
        Height(5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "제목",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PriceEditor extends StatefulWidget {
  final TextEditingController controller;

  _PriceEditor(this.controller);

  @override
  State<_PriceEditor> createState() => _PriceEditorState();
}

class _PriceEditorState extends State<_PriceEditor> {
  bool isDonateMode = false;
  final priceNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "거래방식".text.bold.make(),
        Row(
          children: [
            RoundButton(
              text: "판매하기",
              theme: isDonateMode ? RoundButtonTheme.whiteWithBlueBorder : RoundButtonTheme.blue,
              onTap: () {
                widget.controller.clear();
                setState(() {
                  isDonateMode = false;
                });
                delay(() {
                  AppKeyboardUtil.show(context, priceNode);
                });
              },
            ),
            RoundButton(
              text: "나눔하기",
              theme: isDonateMode ? RoundButtonTheme.blue : RoundButtonTheme.whiteWithBlueBorder,
              onTap: () {
                widget.controller.text = "0";
                setState(() {
                  isDonateMode = true;
                });
              },
            ),
          ],
        ),
        Height(5),
        TextField(
          focusNode: primaryFocus,
          controller: widget.controller,
          enabled: isDonateMode ? false : true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "가격을 입력해주세요",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DescEditor extends StatelessWidget {
  final TextEditingController controller;
  final Address address;

  _DescEditor(this.controller, this.address);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "자세한 설명".text.bold.make(),
        Height(5),
        TextField(
          maxLines: 7,
          controller: controller,
          decoration: InputDecoration(
            hintText: "${address.simpleAddress} 동네임~",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
