import 'package:flutter/material.dart';
import 'package:we_help/constants.dart';

class RoundedBorderButton extends StatelessWidget {
  final String text;
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final Function press; // Function that will fire when clicked
  final double border;
  final Color color, textColor;

  const RoundedBorderButton({
    Key key,
    this.text,
    this.width = 0.8,
    this.height = 0.07,
    this.press,
    this.color = PrimaryColor,
    this.border = 1.5,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.height * height,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: PrimaryColor, style: BorderStyle.solid, width: border),
              color: color,
              borderRadius:
                  BorderRadius.only(bottomRight: const Radius.circular(100.0))),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: SubheadingFontSize,
                  fontFamily: PrimaryFontFamily),
            ),
          ),
        ),
        onTap: () {
          press();
        },
      ),
    );
  }
}
