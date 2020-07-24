import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/text_field_container.dart';

// TODO: fix text alignment
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextCapitalization keyboardMode;
  final String startText;
  final double height;
  final Color primaryColor;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.all_inclusive,
      this.onChanged,
      this.keyboardMode = TextCapitalization.none,
      this.startText = "",
      this.height = 0.07,
      this.primaryColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: startText);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return TextFieldContainer(
      height: height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        controller: controller,
        cursorColor: primaryColor,
        textCapitalization: keyboardMode,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
