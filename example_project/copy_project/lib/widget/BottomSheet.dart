import 'package:copy_project/widget/ui_widget/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomSheetWidget extends StatefulWidget {
  final String title;
  final String? description;
  final List<String> optionList;
  final String selectedItem;
  final ValueChanged<String>? onValueChanged;

  const BottomSheetWidget(
      {super.key,
      required this.title,
      required this.optionList,
      required this.selectedItem,
      this.description,
      this.onValueChanged});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late String currentSelectItem;

  @override
  void initState() {
    super.initState();
    currentSelectItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFF2a2c2e),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: widget.title.text.size(18).color(Colors.white).bold.make()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ).pOnly(top: 20, left: 20, right: 20),
          widget.description != null
              ? "Select whether the application will play or mute alert tones."
                  .text
                  .size(13)
                  .color(Color(0xFF8f8f8f))
                  .make()
                  .pOnly(top: 9, left: 20, right: 20)
              : goneWidget.pOnly(bottom: 25),
          Column(
            children: widget.optionList.map((item) {
              return RadioListTile(
                  title: item.toString().text.color(Colors.white).make(),
                  value: item,
                  groupValue: currentSelectItem,
                  onChanged: (value) {
                    setState(() {
                      // widget.selectedItem = value;
                      currentSelectItem = value!;
                      widget.onValueChanged!(currentSelectItem);
                    });
                  });
            }).toList(),
          )
        ],
      ),
    );
  }
}
