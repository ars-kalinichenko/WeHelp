import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  /// Clickable text that calls onPressed () when you click on it.

  final String text;
  final TextStyle textStyle;
  final Function onPressed;

  const TextButton({
    Key key,
    this.text,
    this.textStyle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Padding container = Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          text,
          style: textStyle
        ),
      ),
    );
    return container;
  }
}
