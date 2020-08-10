import 'package:flutter/material.dart';

class TipsWithBackground extends StatelessWidget {
  /// Creates elements with text and images in the background.
  /// Used as prompts on the home screen..
  final String title;
  final String description;
  final Function press;
  final double width;
  final double height;
  final String imagePath;

  const TipsWithBackground({
    Key key,
    this.title,
    this.description,
    this.press,
    this.width = 0.4,
    this.height = 0.11,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container container = Container(
      // The wrapper for the entire widget.
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      margin: EdgeInsets.only(right: size.width * 0.03),
      width: size.width * width,
      height: size.height * height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
            overflow: TextOverflow.fade,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            description,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, color: Colors.white,
            ),
          )
        ],
      ),
    );
    return container;
  }
}
