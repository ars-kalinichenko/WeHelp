
import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  /// Rounded button widget with gradient.

  final String text; // Text in button
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final Function press; // Function that will fire when clicked
  final Color color, textColor; // Button color and text color
  final double borderSize; // Size of border
  final double textSize; // Size of text

  const RoundedGradientButton(
      {Key key,
      this.text,
      this.width = 0.8,
      this.height = 0.08,
      this.press,
      this.color = Colors.white,
      this.textColor = Colors.white,
      this.borderSize = 1.5,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Container container = Container(
        width: size.width * width,
        height: size.height * height,
        child: InkWell(
            onTap: press,
            child: ClipRect(
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff0072FF), Color(0xff00C6FF)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: borderSize),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ) // changes position of shadow
                  ],
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                    ),
                  ),
                ),
              ),
            )));
    return container;
  }
}
