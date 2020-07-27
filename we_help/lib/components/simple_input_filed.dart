import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleInputField extends StatelessWidget {
  /// Simple text field for entering email, description, etc.

  final String hintText; // Help text
  final Color color; // Text and cursor color
  final int maxLength; // Max Length of text
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final ValueChanged<String> onChanged; // When the string changes -> onChange()

  const SimpleInputField(
      {Key key,
      this.hintText,
      this.color = Colors.grey,
      this.maxLength = 40,
      this.width = 0.7,
      this.height = 0.07,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container container = Container(
      width: size.width * width,
      height: size.height * height,
      alignment: Alignment.center,
      child: TextFormField(
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline3,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color,
          maxLength: maxLength,
          decoration: InputDecoration(
              hintText: hintText, fillColor: color, counterText: ""),
          onChanged: onChanged),
    );
    return container;
  }
}
