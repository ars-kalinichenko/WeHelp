import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  /// Text filed with icon for search.

  final String hintText; // Help text
  final Color color; // Text and cursor color
  final int maxLength; // Max Length of text
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final ValueChanged<String> onChanged; // When the string changes -> onChange()
  final Function onPressed;

  const SearchInputField(
      {Key key,
      this.hintText,
      this.color = Colors.grey,
      this.maxLength = 255,
      this.width = 0.7,
      this.height = 0.1,
      this.onChanged,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final OutlineInputBorder borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide:
            BorderSide(color: Color(0xff0574E5), width: 1.5));

    Container container = Container(
      width: size.width * width,
      height: size.height * height,
      alignment: Alignment.center,

      child: TextField(
          textAlign: TextAlign.left,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.headline6,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color,
          maxLength: maxLength,
          decoration: InputDecoration(
              enabledBorder: borderStyle,
              disabledBorder: borderStyle,
              focusedBorder: borderStyle,
              prefixIcon: Icon(Icons.search, color: Color(0xff3F3D56)),
              suffixIcon: IconButton(
                icon: Icon(Icons.navigate_next,
                    color: Color(0xff3F3D56), size: 30),
                onPressed: onPressed,
              ),
              hintText: hintText,
              fillColor: color,
              counterText: ""),
          onChanged: onChanged),
    );
    return container;
  }
}
