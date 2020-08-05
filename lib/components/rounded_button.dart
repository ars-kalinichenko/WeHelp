import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  ///Rounded button widget with specified dimensions (percent of screen size)
  /// and specified text parameters. When pressed, the press () function is called.

  final String text; // Text in button
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final Function press; // Function that will fire when clicked
  final Color color, textColor; // Button color and text color
  final double fontSize; // Size of text

  const RoundedButton({
    Key key,
    this.text,
    this.width = 0.66,
    this.height = 0.07,
    this.press,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Container container = Container(
      width: size.width * width,
      height: size.height * height,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xff00C6FF), width: 2.5),

          ),
          color: color,
          splashColor: Colors.transparent,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
    );
    return container;
  }
}
