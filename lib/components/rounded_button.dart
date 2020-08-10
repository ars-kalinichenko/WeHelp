import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  ///Rounded button widget with specified dimensions (percent of screen size)
  /// and specified text parameters. When pressed, the press () function is called.

  final String text; // Text in button
  final double width; // Relative value for adaptive width
  final double height; // Relative value for adaptive height
  final Function press; // Function that will fire when clicked

  const RoundedButton({
    Key key,
    this.text,
    this.width = 0.66,
    this.height = 0.07,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ConstrainedBox box = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: size.width * width,
        minHeight: size.height * height,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Color(0xff0073FF),
        splashColor: Colors.transparent,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
    return box;
  }
}
