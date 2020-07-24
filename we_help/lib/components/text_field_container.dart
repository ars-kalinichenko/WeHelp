import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height; // Relative value for adaptive width

  const TextFieldContainer({
    Key key,
    this.child,
    this.width = 0.8,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * width,
      height: size.height * height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(bottomRight: const Radius.circular(70.0)),
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.5)),
      child: child,
    );
  }
}
