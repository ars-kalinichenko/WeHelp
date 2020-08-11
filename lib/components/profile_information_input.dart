import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  /// Text filed with icon for search.

  final String hintText; // Help text
  final Color color; // Text and cursor color
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final ValueChanged<String> onChanged; // When the string changes -> onChange()

  const ProfileInputField({
    Key key,
    this.hintText,
    this.color = Colors.grey,
    this.width = 0.8,
    this.height = 0.07,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container container = Container(
      width: size.width * width,
      height: size.height * height,
      alignment: Alignment.center,
      child: new TextField(
        decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            hintStyle: new TextStyle(color: Color(0xff716E92)),
            hintText: "Type in your text",
            fillColor: Color(0xffD7E4F4)),
      ),
    );
    return container;
  }
}
