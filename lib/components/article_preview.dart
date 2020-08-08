import 'package:flutter/material.dart';
import 'package:we_help/models/tag.dart';

class ArticlePreview extends StatelessWidget {
  /// Creates an article preview widget.
  /// Used in the home screen and search screen.
  final String author;
  final String title;
  final String description;
  final List<Tag> tags;
  final String date;
  final String time;
  final int answersCount;
  final Function press;
  final String contentKey;
  final double width;
  final double height;

  const ArticlePreview(
      {Key key,
      this.author,
      this.title,
      this.description,
      this.tags,
      this.date,
      this.time,
      this.answersCount,
      this.press,
      this.contentKey,
      this.width = 0.9,
      this.height = 0.30})
      : super(key: key);

  List<Widget> buildTagWidgets(double screenWidth, List<Tag> tagList) {
    /// Returns a list of tag widgets with text, background and padding.
    return tagList
        .map((tag) => Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
            margin: EdgeInsets.only(right: screenWidth * 0.02),
            decoration: BoxDecoration(
                color: Color(0xffC4C4C4),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Text(tag.name)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container container = Container(
      // The wrapper for the entire widget.
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      margin: EdgeInsets.only(bottom: size.height * 0.03),
      width: size.width * width,
      height: size.height * height,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xff60626D)),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        // Main column
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            author,
            style: TextStyle(fontSize: 16, color: Color(0xff3F3D56)),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff3F3D56)),
          ),
          Text(description,
              style: TextStyle(fontSize: 14, color: Colors.black)),

          // A container with scrollable tags.
          Container(
            height: size.height * 0.03,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildTagWidgets(size.width, tags),
            ),
          ),

          Text("$date · $time",
              style: TextStyle(fontSize: 12, color: Color(0xff3F3D56))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$answersCount ответов",
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              Text("2.5K",
                  style: TextStyle(fontSize: 14, color: Color(0xff3F3D56)))
            ],
          ),
        ],
      ),
    );
    return container;
  }
}
