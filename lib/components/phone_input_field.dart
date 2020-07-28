import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputField extends StatelessWidget {
  /// Widget for entering a phone number.
  /// Uses the mask_text_input_formatter library to create the mask.
  ///  onChanged() returns a string with the mask applied.

  final String hintText; // Help text
  final Color color; // Text and cursor color
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final ValueChanged<String> onChanged; // When the string changes -> onChange()

  const PhoneInputField(
      {Key key,
      this.hintText = "7 (999) 999-99-99",
      this.color = Colors.grey,
      this.width = 0.7,
      this.height = 0.07,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var maskFormatter = new MaskTextInputFormatter(
        mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

    Container container = Container(
      width: size.width * width,
      height: size.height * height,
      alignment: Alignment.center,

      child: TextFormField(
          inputFormatters: [maskFormatter],
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline3,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(hintText: hintText, fillColor: color),
          onChanged: onChanged),
    );
    return container;
  }
}
