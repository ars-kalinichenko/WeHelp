import 'package:flutter/material.dart';
import 'package:we_help/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final Function press; // Function that will fire when clicked
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.width = 0.8,
    this.height = 0.07,
    this.press,
    this.color = PrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * width,
      height: size.height * height,
      child: ClipRRect(
        borderRadius:
            BorderRadius.only(bottomRight: const Radius.circular(100.0)),
        child: FlatButton(
          color: color,
          splashColor: Colors.transparent,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: SubheadingFontSize),
          ),
        ),
      ),
    );
  }
}
