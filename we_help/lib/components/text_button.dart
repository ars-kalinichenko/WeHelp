import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool underline;
  final Function onPressed;

  const TextButton(
      {Key key,
      this.text,
      this.fontSize = 18,
      this.textColor = Colors.black,
      this.fontFamily,
      this.fontWeight = FontWeight.normal,
      this.underline = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextDecoration _decoration = TextDecoration.none;
    if (underline) {
      _decoration = TextDecoration.underline;
    }

    Container container = Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: InkWell(
          onTap: onPressed,
          child: Text(
            text,
            style: TextStyle(
                decoration: _decoration,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: textColor,
                fontFamily: fontFamily),
          ),
        ));
    return container;
  }
}
