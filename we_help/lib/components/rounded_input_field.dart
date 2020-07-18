import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/text_field_container.dart';
import 'package:we_help/constants.dart';

// TODO: fix text aligment
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextCapitalization keyboardMode;
  final String startText;
  final double height;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.all_inclusive,
      this.onChanged,
      this.keyboardMode = TextCapitalization.none,
      this.startText = "",
      this.height = 0.07})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: startText);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return TextFieldContainer(
      height: height,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: PrimaryColor,
        textCapitalization: keyboardMode,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: PrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
